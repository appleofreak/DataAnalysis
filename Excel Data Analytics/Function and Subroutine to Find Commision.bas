Attribute VB_Name = "Module1"
Sub ComVal()
curSales = Range("C2").Value
curCom = 0.1
curCommVal = curCom * curSales
MsgBox (curCommVal)
End Sub

Function CalCommVal(curSales As Currency)
CalCommVal = curSales * 0.1
End Function
