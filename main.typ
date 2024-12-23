#import "settings/variables.typ": *
#import "settings/lib.typ": thesis
#import "@preview/glossy:0.4.0": *

// Init glossary
#show: init-glossary.with(yaml("/glossary.yaml"))

#set text(font: "Aptos")


#show: doc => thesis(
    title: topicOfPaper,
    doc
)

= Hello World
#lorem(80)

#figure(
    image("assets/dhbw_logo.jpg"),
    caption: [Ein tolles Bild]
)

#lorem(200)

#figure(
    table(
        align: horizon,
        columns: (30%, 30%),
        "Hello World",
        "Simple but cool code to start"
    ),
    caption: [Eine tolle Tabelle]
)

@la
Theres also @a:html document within this website