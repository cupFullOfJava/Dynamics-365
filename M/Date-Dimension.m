let
    StartDate = #date(2000,1,1),
    EndDate = Date.From(Date.AddYears(DateTime.LocalNow(), 20)),
    NumberOfDays = Duration.Days( EndDate - StartDate ),
    Dates = List.Dates(StartDate, NumberOfDays+1, #duration(1,0,0,0)),
    #"Converted to Table" = Table.FromList(Dates, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    #"Renamed Columns" = Table.RenameColumns(#"Converted to Table",{{"Column1", "Date"}}),
    #"Changed Type" = Table.TransformColumnTypes(#"Renamed Columns",{{"Date", type date}}),
    #"Inserted Year" = Table.AddColumn(#"Changed Type", "Year", each Date.Year([Date]), type number),
    #"Inserted Month" = Table.AddColumn(#"Inserted Year", "Month", each Date.Month([Date]), type number),
    #"Inserted Month Name" = Table.AddColumn(#"Inserted Month", "Month Name", each Date.MonthName([Date]), type text),
    #"Inserted Quarter" = Table.AddColumn(#"Inserted Month Name", "Quarter", each Date.QuarterOfYear([Date]), type number),
    #"Inserted Week of Year" = Table.AddColumn(#"Inserted Quarter", "Week of Year", each Date.WeekOfYear([Date]), type number),
    #"Inserted Week of Month" = Table.AddColumn(#"Inserted Week of Year", "Week of Month", each Date.WeekOfMonth([Date]), type number),
    #"Inserted Day" = Table.AddColumn(#"Inserted Week of Month", "Day", each Date.Day([Date]), type number),
    #"Inserted Day of Week" = Table.AddColumn(#"Inserted Day", "Day of Week", each Date.DayOfWeek([Date]), type number),
    #"Inserted Day of Year" = Table.AddColumn(#"Inserted Day of Week", "Day of Year", each Date.DayOfYear([Date]), type number),
    #"Inserted Day Name" = Table.AddColumn(#"Inserted Day of Year", "Day Name", each Date.DayOfWeekName([Date]), type text),
    #"Change Column Types to Int" = Table.TransformColumnTypes(#"Inserted Day Name",{{"Year", Int64.Type}, {"Month", Int64.Type}, {"Quarter", Int64.Type}, {"Week of Year", Int64.Type}, {"Week of Month", Int64.Type}, {"Day", Int64.Type}, {"Day of Week", Int64.Type}, {"Day of Year", Int64.Type}})
in
    #"Change Column Types to Int"



/*
Implemented from RADACAD.
http://radacad.com/create-a-date-dimension-in-power-bi-in-4-steps-step-1-calendar-columns
*/
