#import "@preview/datify:0.1.3": custom-date-format, month-name

// Set date header correctly formatted
#let dateFmtToday(lang, header) = {
  if header == true {
    if lang == "de" {
      custom-date-format(datetime.today(), "DD. " + month-name(datetime.today().month(), "de", true) + " YYYY")
    } else if lang == "en" {
      custom-date-format(datetime.today(), "Month DD, YYYY")
    } else {
      custom-date-format(datetime.today(), "MM/DD/YYYY")
    }
  } else {
    if lang == "de" {
      custom-date-format(datetime.today(), "DD.MM.YYYY")
    } else if lang == "en" {
      custom-date-format(datetime.today(), "MM/DD/YYYY")
    } else {
      custom-date-format(datetime.today(), "MM/DD/YYYY")
    }
  }
}

#let dateFmt(lang, header, date) = {
  if header == true {
    if lang == "de" {
      custom-date-format(date, "DD. " + month-name(date.month(), "de", true) + " YYYY")
    } else if language == "en" {
      custom-date-format(date, "Month DD, YYYY")
    } else {
      custom-date-format(date, "MM/DD/YYYY")
    }
  } else {
    if lang == "de" {
      custom-date-format(date, "DD.MM.YYYY")
    } else if lang == "en" {
      custom-date-format(date, "MM/DD/YYYY")
    } else {
      custom-date-format(date, "MM/DD/YYYY")
    }
  }
}