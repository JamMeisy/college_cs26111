Sub GenerateReport()
    Dim ws As Worksheet
    Set ws = ThisWorkbook.Sheets.Add
    ws.Name = "Report"
    
    ' Generate Headers
    AddHeaders ws
    
    ' Generate Random Data
    Dim rows As Integer
    rows = InputBox("Enter the number of rows of data:", "Generate" & number & "Samples")
    GenerateSampleData ws, rows
    
    ' Format Rnadom Data
    FormatReport ws, rows

    MsgBox "Report Generated Successfully!", vbInformation
End Sub

Sub AddHeaders(ws As Worksheet)
    ws.Cells(1, 1).Value = "ID"
    ws.Cells(1, 2).Value = "Name"
    ws.Cells(1, 3).Value = "Department"
    ws.Cells(1, 4).Value = "Sales"
    ws.Cells(1, 5).Value = "Hiring Date"
    
    ws.Range("A1:E1").Font.Bold = True
End Sub

Sub GenerateSampleData(ws As Worksheet, rows As Integer)
    Dim i As Integer
    Dim departments As Variant
    
    departments = Array("Marketing", "Sales", "HR", "IT", "Finance")
    
    ' Adding Data
    For i = 1 To rows
        ws.Cells(i + 1, 1).Value = 100 + i              ' ID
        ws.Cells(i + 1, 2).Value = "Employee " & i      ' Name
        ws.Cells(i + 1, 3).Value = departments(i Mod 5) ' Department
        ws.Cells(i + 1, 4).Value = 1000 + (Rnd * 4000)  ' Sales
        ws.Cells(i + 1, 5).Value = Date - (Rnd * 365)   ' Hiring Date
    Next i
End Sub

' Conditional Formatting
Sub FormatReport(ws As Worksheet, rows As Integer)
    ws.Columns("D").NumberFormat = "$#,##0.00"
    ws.Columns.AutoFit
    ' Highlight Sales > $3000
    Dim i As Integer
    For i = 1 To rows
        If ws.Cells(i + 1, 4).Value > 3000 Then
            ws.Cells(i + 1, 4).Interior.Color = RGB(144, 238, 144)
        End If
    Next i
End Sub
