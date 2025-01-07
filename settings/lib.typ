#import "@preview/chic-hdr:0.4.0": *
#import "variables.typ": *
#import "datefmt.typ": dateFmt, dateFmtToday
#import "@preview/glossy:0.4.0": *

#show: init-glossary.with(yaml("../glossary.yaml"))

#let visible_outline(..args) = {
  show outline: set heading(outlined: true)
  outline(..args)
}


#let thesis(
  title: topicOfPaper,
  author: author,
  language: "de",
  campus: "Mannheim",
  headers: ("", ""),
  doc,
) = {


  set page(
    paper: "a4"
  )

  // Add header images
  grid(
    columns: (1fr, 2fr, 1fr),
    rows: 55pt,
    scale(120%, image("../assets/schwarz_logo.jpg")),
    text(""),
    scale(115%, image("../assets/dhbw_logo.jpg"))
  )

  // Text language
  set text(lang: language, size: 11pt)

  // Set title 
  v(1.5cm)
  align(center)[
    #text(topicOfPaper, weight: "bold", size: 12pt)
    #v(2cm)
    #text("im Studiengang")
    #v(1cm)
    #text(courseOfStudy)
    #v(1cm)
    #if language == "de" {
      "an der " + text(dhbw_de + " " + campus, style: "italic")
    } else {
      "at the " + text(dhbw_en + " " + campus, style: "italic")
    }
    #v(1.5cm)
    #if language == "de" {
      "von"
    } else {
      "by"
    }
    #v(1cm)
  ]


  // Daten
  h(0.23cm)
  if language == "de" {
    "Name, Vorname:   " + surname + ", " + name
  } else {
    "Surname, Name:   " + surname + ", " + name
  }
  v(0.2cm)
  h(0.23cm)
  if language == "de" {
    "Abgabedatum:       " + dateFmt(language, false, datetime(year: 2024, month: 10, day: 4))
  }
  v(0.5cm)

  grid(
    columns: (135pt, 1fr),
    inset: 10pt,
    align: horizon,
    text("Bearbeitungszeitraum"),
    text(dateFmt(language, false, startDate) + " - " + dateFmt(language, false, endDate)),
    text("Matrikelnummer"),
    matrNumber,
    text("Ausbildungsfirma"),
    text(company),
    text("Betrieblicher Betreuer"),
    supervisor
  )

  v(0.8cm)
  grid(
    columns: (135pt, 1fr),
    align: bottom,
    text("Unterschrift Betreuer   "),
    line(length: 6cm, stroke: 0.6pt)
  )

  pagebreak()

  // Set counter to first page
  counter(page).update(1)
  set page(numbering: "I")

  // Set headers
  // show: chic.with(
  //   chic-footer(
  //       center-side: chic-page-number()
  //   ),
  //   chic-header(
  //     // Set title as left header as default
  //     left-side: if headers.at(0) == "" {
  //       title
  //     } else {
  //       headers.at(0)
  //     },
  //     // Set date as right header as default
  //     right-side: if headers.at(1) == "" {
  //       dateFmtToday(language, true)
  //     } else {
  //       headers.at(1)
  //     }
  //   ),
  //   // Underline for header
  //   chic-separator(on: "header", 1pt)
  // ) 
  
  set page(
    header: [
      // Left part
      #if headers.at(0) == "" {
         title
      } else {
         headers.at(0)
      }
      // Divider
      #h(1fr)
      // Right part
      #if headers.at(1) == "" {
         dateFmtToday(language, true)
       } else {
         headers.at(1)
       }])


  outline()
  pagebreak()

  include "disclosure.typ"

  // Abbildungsverzeichnis
  pagebreak()
  visible_outline(
    title: if language == "de" {
      "Abbildungsverzeichnis"
    } else {
      "List of figures"
    },
    target: figure.where(kind: image)
  )

  // Tabellenverzeichnis
  pagebreak()
  visible_outline(
    title: if language == "de" {
      "Tabellenverzeichnis"
    } else {
      "List of tables"
    },
    target: figure.where(kind: table)
  )

  // Abkürzungsverzeichnis
  pagebreak()
  // Needed for printing
  glossary(
  title: 
    if language == "de" {
      "Abkürzungsverzeichnis"
    } else {
      "List of acronyms"
    }, // Optional: defaults to Glossary
  ignore-case: false, // Optional: ignore case when sorting terms 
  groups: ("Acronyms"),
  theme: theme-academic,
  )


  // Glossar
  pagebreak()
  // Needed for printing
  glossary(
  title: 
    if language == "de" {
      "Glossar"
    } else {
      "Glossary"
    }, // Optional: defaults to Glossary
  ignore-case: false, // Optional: ignore case when sorting terms 
  groups: (""),
  theme: theme-academic,
  )

  // Glossar
  pagebreak()

  // Reset counter and set numbering to Arabic
  counter(page).update(1)
  set page(numbering: "1")
  set heading(numbering: "1.1.")

  doc
}