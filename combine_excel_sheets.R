library(readxl)
library(dplyr)
library(openxlsx)

file_path <- "<path>"

sheets_list <- excel_sheets(file_path)

combined_sheets <- list()

for (sheet in sheets_list[1:length(sheets_list)]) {
  data <- read_excel(file_path, sheet = sheet)
  cat(dim(data), sheet, "\n")
  data$sheet_name <- rep(sheet, nrow(data))
  combined_sheets <- append(combined_sheets, list(data))
}

combined <- do.call("rbind", combined_sheets)
write.xlsx(combined, file = "<dest_path>",
           row.names = FALSE)