Attribute VB_Name = "Module1"
Sub alpha_test():

    Dim Ticker As String
    Dim TotalSV As Double
    Dim open1 As Double
    Dim Close1 As Double
    Dim ws As Worksheet
    
    For Each ws In ThisWorkbook.Sheets
    
    

    
      
        LastRow = ws.Cells(Rows.Count, 1).End(xlUp).Row

        ws.Cells(1, 9).Value = "Ticker"
        ws.Cells(1, 10).Value = "Yearly Change"
        ws.Cells(1, 11).Value = "Percent Change"
        ws.Cells(1, 12).Value = "Total Stock Volume"

        TotalSV = 0

        open1 = 57.19
        Close1 = 0
        summary_table_row = 2
        
        
        
        
        
        For i = 2 To LastRow
        
            
            
            If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
                ws.Cells(summary_table_row, 9).Value = ws.Cells(i, 1).Value
                ws.Cells(summary_table_row, 12).Value = TotalSV + Cells(i, 7).Value
                Close1 = Cells(i, 6).Value
                ws.Cells(summary_table_row, 10).Value = Close1 - open1
                If open1 <> 0 Then
                    ws.Cells(summary_table_row, 11).Value = Format(((Close1 - open1) / open1), ["Percent"])
                Else
                    ws.Cells(summary_table_row, 11).Value = Format((Close1 - open1) / (open1 + 0.001), ["Percent"])
                End If
                
                
                summary_table_row = summary_table_row + 1
                TotalSV = 0
                open1 = ws.Cells(i + 1, 3).Value
            
            
          
            
            
            Else
                TotalSV = TotalSV + ws.Cells(i, 7).Value
          
            
            End If
        
        
        
        
        Next i
        
        ws.Cells(2, 14).Value = "Greatest % Increase"
    
        ws.Cells(3, 14).Value = "Greates % Decreasae"
        ws.Cells(4, 14).Value = "Greatest Total Volume"
        
        ws.Cells(1, 15).Value = "Ticker"
        ws.Cells(1, 16).Value = "Value"
        
          
       

        LastRow = ws.Cells(Rows.Count, 11).End(xlUp).Row
        
        For t = 2 To LastRow
        
            If ws.Cells(t, 10).Value >= 0 Then
            ws.Cells(t, 10).Interior.Color = vbGreen
            Else
            ws.Cells(t, 10).Interior.Color = vbRed
            End If
        Next t
        
        Dim max As Long
        Dim Min As Long
        Dim Totalv As Double
        
        
        max = 0
        Min = 0
        Totalv = 0
        
        
        
        For x = 2 To LastRow
        
            If ws.Cells(x, 11).Value > max Then
                max = Cells(x, 11).Value
                ws.Cells(2, 15).Value = ws.Cells(x, 9).Value
                ws.Cells(2, 16).Value = max

            
            Else
                max = max
            
            End If
            
           
        Next x
            
            
        For y = 2 To LastRow
        
            If ws.Cells(y, 11).Value < Min Then
                Min = ws.Cells(y, 11).Value
                ws.Cells(3, 15).Value = ws.Cells(y, 9).Value
                ws.Cells(3, 16).Value = Min
            Else
                Min = Min
                
            End If
        Next y
        
        
        For Z = 2 To LastRow
            
            If ws.Cells(Z, 12).Value > Totalv Then
                Totalv = ws.Cells(Z, 12).Value
                ws.Cells(4, 16).Value = ws.Cells(Z, 12).Value
                ws.Cells(4, 15).Value = ws.Cells(Z, 9).Value
            Else
                Totalv = Totalv
            End If
            
            
        Next Z
        
    Next ws
    
        

          
   

End Sub
