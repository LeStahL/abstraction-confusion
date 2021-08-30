/* Abstraction-Confusion
 * Copyright (C) 2021  Alexander Kraus <nr4@z10.info>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#version 450

layout (location = 0) uniform float iTime;
layout (location = 1) uniform int iFrame;
layout (location = 2) uniform int iPass;
layout (location = 3) uniform sampler2D iChannel0;
uniform sampler2D iChannel1;

out vec4 out_color;

float f = .0545,
    k = .062,
    bpm = 90.,
    spb = 60./bpm,
    stepTime,
    nbeats,
    scale,
    pi = 3.14159,
    fsaa = 144.,
    hardBeats;
vec2 unit,
    r = vec2(1.,.5),
    iResolution = vec2(1920,1080);
vec3 c = vec3(1.,0.,-1.);

// Creative Commons Attribution-ShareAlike 4.0 International Public License
// Created by David Hoskins.
// See https://www.shadertoy.com/view/4djSRW
vec2 hash22(vec2 p)
{
	vec3 p3 = fract(vec3(p.xyx) * vec3(.1031, .1030, .0973));
    p3 += dot(p3, p3.yzx+33.33);
    return fract((p3.xx+p3.yz)*p3.zy);
}

// Creative Commons Attribution-ShareAlike 4.0 International Public License
// Created by David Hoskins.
// See https://www.shadertoy.com/view/4djSRW
float hash12(vec2 p)
{
	vec3 p3  = fract(p.xyx * .1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.x + p3.y) * p3.z);
}

float lfnoise(vec2 t)
{
    vec2 i = floor(t);
    t = smoothstep(c.yy, c.xx, fract(t));
    vec2 v1 = vec2(hash12(i), hash12(i+c.xy)),
    v2 = vec2(hash12(i+c.yx), hash12(i+c.xx));
    v1 = c.zz+2.*mix(v1, v2, t.y);
    return mix(v1.x, v1.y, t.x);
}

float dbox3(vec3 x, vec3 b)
{
  b = abs(x) - b;
  return length(max(b,0.))
         + min(max(b.x,max(b.y,b.z)),0.);
}

// Distance to star
float dstar(vec2 x, float N, vec2 R)
{
    float d = pi/N,
        p0 = acos(x.x/length(x)),
        p = mod(p0, d);
    vec2 a = mix(R,R.yx,mod(round((p-p0)/d),2.)),
    	p1 = a.x*c.xy,
        ff = a.y*vec2(cos(d),sin(d))-p1;
    return dot(length(x)*vec2(cos(p),sin(p))-p1,ff.yx*c.zx)/length(ff);
}

float dhexagonpattern(vec2 p) 
{
    vec2 q = vec2(p.x*1.2, p.y + p.x*.6),
        qi = floor(q),
        pf = fract(q);
    float v = mod(qi.x + qi.y, 3.);
    
    return dot(step(pf.xy,pf.yx), 1.-pf.yx + step(1.,v)*(pf.x+pf.y-1.) + step(2.,v)*(pf.yx-2.*pf.xy));
}

float m(vec2 x)
{
    return max(x.x,x.y);
}

float d210(vec2 x)
{
    return min(max(max(max(max(min(max(max(m(abs(vec2(abs(abs(x.x)-.25)-.25, x.y))-vec2(.2)), -m(abs(vec2(x.x+.5, abs(abs(x.y)-.05)-.05))-vec2(.12,.02))), -m(abs(vec2(abs(x.x+.5)-.1, x.y-.05*sign(x.x+.5)))-vec2(.02,.07))), m(abs(vec2(x.x+.5,x.y+.1))-vec2(.08,.04))), -m(abs(vec2(x.x, x.y-.04))-vec2(.02, .08))), -m(abs(vec2(x.x, x.y+.1))-vec2(.02))), -m(abs(vec2(x.x-.5, x.y))-vec2(.08,.12))), -m(abs(vec2(x.x-.5, x.y-.05))-vec2(.12, .07))), m(abs(vec2(x.x-.5, x.y))-vec2(.02, .08)));
}

// x: material
// y: distance
// z: reflectivity
vec3 add(vec3 a, vec3 b)
{
    if(a.y < b.y) return a;
    return b;
}

vec3 hsv2rgb(vec3 cc)
{
    vec4 K = vec4(1., 2. / 3., 1. / 3., 3.);
    vec3 p = abs(fract(cc.xxx + K.xyz) * 6. - K.www);
    return cc.z * mix(K.xxx, clamp(p - K.xxx, 0., 1.), cc.y);
}

vec2 rgb2sv(vec3 cc)
{
    vec4 K = vec4(0., -1. / 3., 2. / 3., -1.),
        p = mix(vec4(cc.bg, K.wz), vec4(cc.gb, K.xy), step(cc.b, cc.g)),
        q = mix(vec4(p.xyw, cc.r), vec4(cc.r, p.yzx), step(p.x, cc.r));
    return vec2((q.x - min(q.w, q.y)) / (q.x + 1.e-10), q.x);
}

vec3 scene(vec3 x)
{
    vec3 k = texture(iChannel0, .5*(x.xy+.5*iResolution/iResolution.y)).xyz;
    return vec3(3.+8.*(k.x+k.y)+.1*k.z*k.x*k.y+nbeats+.5*x.x*x.y, x.z+.015-.65*smoothstep(90.,85.,iTime)*sqrt(abs(lfnoise(.1*x.xy+.66)*lfnoise(nbeats*c.xx+.31)))*k.y, .6)*vec3(1.,.25,1.);
}

bool ray(inout vec3 col, out vec3 x, float d, vec3 dir, out vec3 s, vec3 o, vec3 l, out vec3 n)
{
    for(int i=0; i<250; ++i)
    {
        x = o + d * dir;
        s = scene(x);

        if(abs(x.z)>.15) break;
        
        if(s.y < 1.e-4)
        {
            // Blinn-Phong Illumination
            float dx = 5.e-5;
            n = normalize(vec3(
                scene(x+dx*c.xyy).y, 
                scene(x+dx*c.yxy).y, 
                scene(x+dx*c.yyx).y
            )-s.y);

            vec3 colors[8] = vec3[8](
                .7*c.xxx,
                vec3(.20,.23,.27),
                vec3(.35,.57,.97),
                vec3(.18,.18,.18),
                vec3(.83,.15,.17),
                vec3(.94,.65,.07).zyx,
                vec3(.85, 1, .20),
                vec3(.23, .46, .24)
            );
            float i = mod(floor(s.x), 8.),
                ip1 = mod(i + 1., 8.);
            col = mix(colors[int(i)], colors[int(ip1)], fract(s.x));

            col = .2 * col
                + col*max(dot(normalize(l-x),n),0.)
                + .7 * col*pow(max(dot(reflect(normalize(l-x),n),dir),0.),2.);
            
            if(x.z < -.01)
            {
                float cc = .035;
                vec2 a = mod(x.xy,cc)-.5*cc,
                    ai = x.xy-mod(x.xy+.5*cc,cc),
                    y = abs(a)-.002;
                col = mix(col, .5*col, smoothstep(1.5/iResolution.y, -1.5/iResolution.y, min(y.x,y.y)))+.06*hash12(ai*1.e2);
            }

            return true;
        }
        d += s.y;
    }
    return false;
}

void main()
{
    stepTime = mod(iTime+.5*spb, spb)-.5*spb;
    nbeats = (11.+((iTime-stepTime+.5*spb)/spb + smoothstep(-.2*spb, .2*spb, stepTime)))*.33;
    scale = smoothstep(-.3*spb, 0, stepTime)*smoothstep(.3*spb, 0, stepTime);
    hardBeats = round((iTime-stepTime)/spb);
    vec2 fragCoord = gl_FragCoord.xy,
        uv = fragCoord/iResolution,
        unit = 1/iResolution;

    if(iTime < 22. || iTime > 80.) 
    {
        nbeats = 1.5;
    }
    
    if(iPass == 0) 
    {
        vec2 a = iResolution.xy/iResolution.y,
        uv0 = 3.*(fragCoord.xy-.5*iResolution.xy)/iResolution.y,
        uva = uv0-3.*(hash22(hardBeats*c.xx)-.5);
        
        vec3 v = texture(iChannel0, fragCoord.xy*unit).xyz;
        vec2 u = v.xy;
        float s = hash12(hardBeats*c.xx),
            sdf;

        out_color.z = v.z;

        // Boundary conditions
        if(iTime > 21. && iTime < 80.) 
        {
            k += .01*lfnoise(.1*uv0+ 2.131 + nbeats*c.xx);
            f += .01*lfnoise(.1*uv0 + nbeats*c.xx+1.31);

            if(scale > .6)
            {
                if(s<.5)
                    sdf = abs(length(uva)-.3)-.1-.13*sin(atan(uva.y,uva.x)*4.*pi);
                else if(s < .66)
                    sdf = d210(uva);
                else
                    sdf = abs(dstar(uva, 5., vec2(.2,.5)))-.05;
                
                u = max(u, .85*smoothstep(35.*unit.x, -35.*unit.x, sdf)*c.xx);
                if(sdf < 0.)
                {
                    out_color.z = iTime;
                }
            }
        }
        else
        {
            // f -= .005;
            k += .001 + .0002*step(iTime, 80.);
        }

        if(iFrame < 10)
        {
            sdf = abs(length(uv0+.3)-.3)-.1-.13*sin(atan(uv0.y+.3,uv0.x+.3)*4.*pi);
            out_color.xy = max(u, .85*smoothstep(35.*unit.x, -35.*unit.x, sdf)*c.xx);
        }
        else
        {
            vec2 l = c.yy;
            vec3 wc = vec3(.05,.2,-1.);
            mat3 w = mat3(wc.xyx, wc.yzy, wc.xyx);
        
            // Laplace operator
            for(int i=0; i<3; ++i)
                for(int j=0; j<3; ++j)
                    l += w[i][j]*texture(iChannel0, (fragCoord.xy + (1.5+.5*lfnoise(nbeats*c.xx))*vec2(ivec2(i,j)-1))*unit).xy;
                    
            // Reaction-Diffusion system
            out_color.xy = u + r*l + c.zx*u.x*u.y*u.y + vec2(f*(1.-u.x), -(f+k)*u.y) + .0005*hash22(uv0*1.e2);
            out_color.xy = clamp(out_color.xy, -1.,1.);
        }
    }
    else if(iPass == 1)
    {
        vec2 uv1 = (fragCoord-.5*iResolution.xy)/iResolution.y;
        vec3 
            o = c.yzx,
            col,
            c1,
            x,
            x1,
            n,
            dir = normalize(uv1.x * c.xyy + uv1.y * cross(c.xyy,normalize(-o))-o),
            l = c.zzx-.5*c.yyx,
            s,
            s1;
            
        // Material ray
        if(ray(col, x, -(o.z-.05)/dir.z, dir, s, o, l, n))
        {
            // Reflections
            if(ray(c1, x1, 2.e-3, reflect(dir,n), s1, x, l, n))
                col = mix(col, c1, s.z);

            // Hard Shadow
            if(ray(c1, x1, 1.e-2, normalize(l-x), s1, x, l, n) && length(l-x1) < length(l-x))
                col *= .5;
        }

        // Gamma
        col += col*col + col*col*col;
        col *= .75;

        // Color drift
        col = mix(col, hsv2rgb(vec3(pi*lfnoise(.1*nbeats*c.xx), rgb2sv(col))),.5);
        col = mix(length(col)/sqrt(3.)*c.xxx, col, clamp(abs(x.z*100.),0.,1.));

        out_color = mix(texture(iChannel1, uv), vec4(clamp(col,0.,1.),1.), .5);
    }
    else
    {
        // SSAA
        vec3 col = c.yyy;
        float bound = sqrt(fsaa)-1.;
        for(float i = -.5*bound; i<=.5*bound; i+=1.)
            for(float j=-.5*bound; j<=.5*bound; j+=1.)
                col += texture(iChannel1, uv+vec2(i,j)*3./max(bound, 1.)*unit).xyz;
        col /= fsaa;

        // edge glow
        vec4 col11 = texture(iChannel1, uv - unit),
            col13 = texture(iChannel1, uv + unit*c.xz),
            col31 = texture(iChannel1, uv + unit*c.zx),
            col33 = texture(iChannel1, uv + unit),
            x = col33 -col11 -3.* texture(iChannel1, uv + unit*c.yz) -col13 + col31 + 3.*texture(iChannel1, uv + unit*c.yx),
            y = col33 -col11 -3.* texture(iChannel1, uv + unit*c.zy) -col31 + col13 + 3.*texture(iChannel1, uv + unit*c.xy);
        out_color = vec4(mix(col, .5*(abs(y.rgb) + abs(x.rgb)).rgb, .3+.3*lfnoise(nbeats*c.xx)),1.);

        // Vignette
        uv *=  1. - uv.yx;
        out_color *= pow(uv.x*uv.y * 15., .2) * smoothstep(0.,2.,iTime) * smoothstep(90.,88., iTime);
    }
}
