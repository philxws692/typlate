#let disclosure(justify, variables-file) = block[
  #import variables-file: *
  #if language == "de" [
      = Sperrvermerk
      #v(.5cm)
      
      #par(justify: justify)[
        Die vorliegende Arbeit beinhaltet vertrauliche Informationen der Firma #text(company, style: "italic").
        Sie ist nur für die Beteiligten am Begutachtungs- und Evaluationsprozess bestimmt. Die
        Weitergabe des Inhalts der Arbeit im Ganzen oder von Teilen daraus an externe Dritte
        sowie das Anfertigen von Abschriften oder Kopien zu welchem Zweck, in welcher Form und
        zu welchem Zeitpunkt auch immer, sind grundsätzlich untersagt. Ausnahmen bedürfen der
        schriftlichen Genehmigung der #text(company, style: "italic"). Eine Weitergabe an Mitarbeiter
        der Hochschule aufgrund fachlicher Belange oder für administrative Zwecke ist von dieser
        Regelung explizit ausgenommen.
      ]
    ] else [
      = Blocking notice
      #v(.5cm)

      #par(justify: justify)[
        This document contains confidential information of the company #text(company, style: "italic").
        It is imperative that the information is utilised exclusively by individuals involved in the assessment and evaluation process.
        The disclosure of the contents of the work in whole or in part to external third parties is strictly prohibited.
        Furthermore, the creation of copies for any purpose, in any form and at any time is strictly prohibited.
        Exceptions to this requirement require the explicit authorisation of the company.
        written authorisation from #text(company, style: "italic").
        Disclosure to employees of the company is permitted.
        of the university for professional or administrative purposes is explicitly excluded from this.
        The unauthorised disclosure of the contents of the work in whole or in part to external third parties, or the making of copies for any purpose, in any form and at any time, is strictly prohibited. Exceptions to this regulation require the written authorisation from #text(company, style: "italic").
      ]
    ]

]