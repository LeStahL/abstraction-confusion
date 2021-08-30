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

#define WIDTH 1920
#define HEIGHT 1080

#define WIN32_LEAN_AND_MEAN
#define WIN32_EXTRA_LEAN
#include <Windows.h>
#include "mmsystem.h"
#include "mmreg.h"
#include <Shlwapi.h>
#include <gl/GL.h>
#include "glext.h"

#include "oidos.h"

extern "C" 
{
	int _fltused = 1;
}

typedef GLuint (APIENTRYP PFNGLCREATESHADERPROGRAMVPROC) (GLenum type, GLsizei count, const GLchar *const*strings);

typedef struct {
	BYTE dmDeviceName[CCHDEVICENAME];
	WORD dmSpecVersion;
	WORD dmDriverVersion;
	WORD dmSize;
	WORD dmDriverExtra;
	DWORD dmFields;
	union {
		struct {
			short dmOrientation;
			short dmPaperSize;
			short dmPaperLength;
			short dmPaperWidth;
			short dmScale;
			short dmCopies;
			short dmDefaultSource;
			short dmPrintQuality;
		};
	
		struct {
			POINTL dmPosition;
			DWORD dmDisplayOrientation;
			DWORD dmDisplayFixedOutput;
		};
	};

	short dmColor;
	short dmDuplex;
	short dmYResolution;
	short dmTTOption;
	short dmCollate;
	BYTE dmFormName[CCHFORMNAME];
	WORD dmLogPixels;
	DWORD dmBitsPerPel;
	DWORD dmPelsWidth;
	DWORD dmPelsHeight;
	union {
		DWORD dmDisplayFlags;
		DWORD dmNup;
	};

	DWORD dmDisplayFrequency;
} HGDEVMODE;

#pragma data_seg("devmode")
static HGDEVMODE devmode = {
	{0}, 0, 0, sizeof(HGDEVMODE), 0, DM_PELSWIDTH | DM_PELSHEIGHT,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, {0}, 0, 0, WIDTH, HEIGHT, 0, 0
};

#pragma data_seg("pfd")
static const PIXELFORMATDESCRIPTOR pfd = {
	sizeof(PIXELFORMATDESCRIPTOR), 1,
	PFD_DRAW_TO_WINDOW|PFD_SUPPORT_OPENGL|PFD_DOUBLEBUFFER,
	PFD_TYPE_RGBA, 32, 0, 0, 0, 0, 0, 0, 8, 0,
	0, 0, 0, 0, 0, 32, 0, 0, PFD_MAIN_PLANE, 0, 0, 0, 0
};

#pragma data_seg("glsl0")
#include "gfx.h"

#pragma data_seg("prcadd")
static const char *gluniform1i = "glUniform1i";

#pragma bss_seg("bss")
 
#pragma code_seg("misc")

#pragma code_seg("mainloop")
void __declspec(naked) __stdcall demo(void) {{
	__asm mov ebp, esp
	__asm sub esp, __LOCAL_SIZE
	
	Oidos_FillRandomData();
	Oidos_GenerateMusic();
	
	ChangeDisplaySettingsA((DEVMODEA*)&devmode, CDS_FULLSCREEN);
	HWND hWnd = CreateWindowExA(0, (char*)0xc019, 0, WS_POPUP|WS_VISIBLE|WS_MAXIMIZE, 0, 0, 0, 0, 0, 0, 0, 0);
	ShowCursor(0);

	HDC hDC = GetDC(hWnd);
	SetPixelFormat(hDC, ChoosePixelFormat(hDC, &pfd), &pfd);
	wglMakeCurrent(hDC, wglCreateContext(hDC));
	GLint program = ((PFNGLCREATESHADERPROGRAMVPROC)wglGetProcAddress("glCreateShaderProgramv"))(GL_FRAGMENT_SHADER, 1, &gfx_frag);
	((PFNGLUSEPROGRAMPROC)wglGetProcAddress("glUseProgram"))(program);

	GLuint framebuffers[3] = {0},
		textures[2];

	glGenTextures(2, &textures[0]);
	((PFNGLGENFRAMEBUFFERSPROC)wglGetProcAddress("glGenFramebuffers"))(2, &framebuffers[0]);
	glDrawBuffer(GL_COLOR_ATTACHMENT0);

	for(int i=0; i<2; ++i)
	{
		((PFNGLACTIVETEXTUREPROC)wglGetProcAddress("glActiveTexture"))(GL_TEXTURE0 + i);
		glBindTexture(GL_TEXTURE_2D, textures[i]);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
		glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA32F, WIDTH, HEIGHT, 0, GL_RGBA, GL_FLOAT, 0);

		((PFNGLBINDFRAMEBUFFERPROC)wglGetProcAddress("glBindFramebuffer"))(GL_FRAMEBUFFER, framebuffers[i]);
		((PFNGLFRAMEBUFFERTEXTURE2DPROC)wglGetProcAddress("glFramebufferTexture2D"))(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, textures[i], 0);
		((PFNGLUNIFORM1IPROC)wglGetProcAddress(gluniform1i))(3+i, i);
	}

	int frame = 0;
	float sample;

	Oidos_StartMusic();

	do {
		sample = Oidos_GetPosition();

		((PFNGLUNIFORM1FPROC)wglGetProcAddress("glUniform1f"))(0, sample/(float)Oidos_TicksPerSecond);		
		((PFNGLUNIFORM1IPROC)wglGetProcAddress(gluniform1i))(1, frame);

		// Simulate more than render
		((PFNGLBINDFRAMEBUFFERPROC)wglGetProcAddress("glBindFramebuffer"))(GL_FRAMEBUFFER, framebuffers[0]);
		((PFNGLUNIFORM1IPROC)wglGetProcAddress(gluniform1i))(2, 0);
		for(int i=0; i<40; ++i)
		{
			glRectf(-1, -1, 1, 1);
			glFlush();
		}

		// Passes
		for(int i=0; i<3; ++i)
		{
			((PFNGLBINDFRAMEBUFFERPROC)wglGetProcAddress("glBindFramebuffer"))(GL_FRAMEBUFFER, framebuffers[i]);
			((PFNGLUNIFORM1IPROC)wglGetProcAddress(gluniform1i))(2, i);
			
			glRectf(-1, -1, 1, 1);
			glFlush();
		}
	
		SwapBuffers(hDC);

		++frame;
	} while (sample < Oidos_MusicLength && !GetAsyncKeyState(VK_ESCAPE));
	
	ExitProcess(0);
}}
