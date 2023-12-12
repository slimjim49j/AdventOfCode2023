#include <stdio.h>
#include <Windows.h>

typedef char s8;

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long u64;

struct OpenFileReturn
{
    u64 bytesRead;
    void *file;
};

OpenFileReturn openFile(char *fileName)
{
    HANDLE fileHandle = CreateFileA(
        fileName,
        GENERIC_READ,
        FILE_SHARE_READ,
        0,
        OPEN_EXISTING,
        0,
        0);
    OpenFileReturn result = {};

    if (fileHandle)
    {
        LARGE_INTEGER fileSize;
        if (GetFileSizeEx(fileHandle, &fileSize))
        {
            void *memory = VirtualAlloc(0, fileSize.QuadPart, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
            if (memory)
            {

                DWORD bytesRead;
                // TODO assert, readfile doesn't take a 64 bit val
                if (ReadFile(
                        fileHandle,
                        memory,
                        fileSize.QuadPart,
                        &bytesRead,
                        0) &&
                    fileSize.QuadPart == bytesRead)
                {
                    result.bytesRead = bytesRead;
                    result.file = memory;
                }
                else
                {
                    VirtualFree(memory, 0, MEM_RELEASE);
                }
            }
            else
            {
                return OpenFileReturn{};
            }
        }
        else
        {
            return OpenFileReturn{};
        }
    }
    else
    {
        return OpenFileReturn{};
    }

    CloseHandle(fileHandle);
    return result;
}

void main()
{
    const char *digits[10] = {};
    digits[0] = "zero";
    digits[1] = "one";
    digits[2] = "two";
    digits[3] = "three";
    digits[4] = "four";
    digits[5] = "five";
    digits[6] = "six";
    digits[7] = "seven";
    digits[8] = "eight";
    digits[9] = "nine";

    OpenFileReturn file = openFile("input");

    if (file.bytesRead && file.file) {
        u8 * input = (u8 *)file.file;
        
    }

    return;
}