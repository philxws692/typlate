
#import "datefmt.typ": dateFmt, dateFmtToday
#import "@preview/glossy:0.7.0": *
#import "disclosure.typ": disclosure
#import "declaration-of-authorship.typ": declaration-of-authorship

#let visible_outline(..args) = {
  show outline: set heading(outlined: true)
  outline(..args)
}


#let thesis(
  title: "",
  //language: "de",
  campus: "Mannheim",
  headers: ("", ""),
  glossary-file: yaml("../glossary.yaml"),
  bibliography-file: "../bibliography.bib",
  appendix-file: "../basic_appendix.typ",
  variables-file: "variables.typ",
  justify: true,
  doc,
) = {
  
  import variables-file: *
  show: init-glossary.with(glossary-file)

  title = topicOfPaper

  set page(
    paper: "a4",
    margin: 2.5cm
  )


  set raw(syntaxes: "../assets/splunk.sublime-syntax")

  // Add header images
  grid(
    columns: (1fr, 2fr, 1fr),
    rows: 55pt,
    scale(120%, image("../assets/company_logo.svg")),
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
    "Abgabedatum:       " + dateFmt(language, false, submissionDate)
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
       }
      #v(-.2cm)
      #line(length: 100%)
    ]
  )


  outline()
  pagebreak()

  disclosure(justify, variables-file)

  pagebreak()

  declaration-of-authorship(justify, variables-file)

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
  
  // Code Verzeichnis
  pagebreak()
  visible_outline(
    title: if language == "de" {
      "Codeverzeichnis"
    } else {
      "Code snippets"
    },
    target: figure.where(kind: raw)
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
  theme: theme-chicago-index,
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
  theme: theme-chicago-index,
  )

  // Glossar
  pagebreak()

  // Reset counter and set numbering to Arabic
  context counter("antimatter").update(counter(page).get())
  counter(page).update(1)
  set page(numbering: "1")
  set heading(numbering: "1.1.")

  set par(justify: justify)

  doc

  pagebreak()

  set page(numbering: "I")
  set heading(numbering: none)
  context counter(page).update(counter("antimatter").get())

  if language == "de" {
    [= Anhang]
  } else {
    [= Appendix]
  }

  include appendix-file

  pagebreak()

  bibliography(bibliography-file, title: if language == "de" {"Literaturverzeichnis"} else {"Bibliography"}, style: "ieee")

}