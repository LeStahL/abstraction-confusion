# Abstraction-Confusion
Abstraction-Confusion is a PC-4k intro by Team210 and CN112, shown at Xenium 2021. It got the third place in the PC-4k intro compo.

# Licenses
* The intro is Copyright (c) 2021, Team210 and CN112, Alexander Kraus <nr4@z10.info> and licensed under GPLv3, see LICENSE.
* FindWindowsSDK is licensed under the Boost Software License - Version 1.0 - August 17th, 2003 and copyright Copyright Iowa State University 2012. See thirdparty/FindWindowsSDK/LICENSE_1_0.txt.
* Oidos is Copyright (c) 2016-2017 Aske Simon Christensen and available under the zlib/libpng License; see oidos/LICENSE.md.
* glext.h is Copyright NVIDIA Corporation 2006 and has its License Details included in itself; see gfx/glext.h.

# Build Requirements and Instructions
* Download, install and add the binary dir to your system PATH for the following software:
    * Visual C++ Toolkit 2017 compiler (for example here: <https://my.visualstudio.com/Downloads?q=visual%20studio%202017&wt.mc_id=o~msft~vscom~older-downloads>). 
    * CMake (<https://cmake.org/download/>).
    * nasm (<https://www.nasm.us/pub/nasm/releasebuilds/2.15.05/>).
    * shader_minifier (<http://www.ctrl-alt-test.fr/dl/shader_minifier.exe>)
    * Crinkler (<https://github.com/runestubbe/Crinkler/releases/tag/v2.3>)
    * glslang-validator (<https://github.com/KhronosGroup/glslang/releases/tag/master-tot>)
* Create an out-of-source build directory, for example `[SOURCE_ROOT]/build`.
* Navigate to this directory
* For debug builds (fast) run `cmake [SOURCE_ROOT] -G"Visual Studio 15 2017" -DCMAKE_BUILD_TYPE=Debug`, for release builds (quite time-consuming), run `cmake [SOURCE_ROOT] -G"Visual Studio 15 2017" -DCMAKE_BUILD_TYPE=Release`
* Run `cmake --build . --config Release`
* Enjoy - And don't forget to have a beer with NR4/Team210 at any Demoparty you feel is appropriate :)

# Links
* Youtube: https://www.youtube.com/watch?v=S-9hCYyxbM4
* Demozoo: https://demozoo.org/productions/299164/
* Pouet: https://www.pouet.net/prod.php?which=89693
