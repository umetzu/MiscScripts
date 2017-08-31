#include <Constants.au3>

Local $iCount = 0

While 1 == 1
   $iCount = $iCount + 1

   WinWaitActive("[CLASS:CommunicatorMainWindowClass]")
   Send("!f")
   Send("{ESC}")
   Send($iCount & "{ENTER}")
   Sleep(15000)
WEnd