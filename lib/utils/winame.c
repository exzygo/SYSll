#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char properties[5][15] = { "Caption", "CSName", "Version", "BuildType", "OSArchitecture" };
  char command[512] = "powershell -NoProfile -Command \"Get-CimInstance Win32_OperatingSystem | Select-Object ";
  for (int i = 0; i < 5; i++) {
    strcat(command, properties[i]); 
    if (i < 4) {
      strcat(command, ", ");
    }
  }
  strcat(command, " | Format-Table -AutoSize\"");
  system(command);
  return 0;
}
