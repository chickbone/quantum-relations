#let firstindent = par(
  text(size: 0pt, ""),
) + v(-1em - 2.926pt)

#let conf(
  title: none,
  author: (),
  headtitle: [],
  textfont: "Harano Aji Mincho",
  headfont: "Harano Aji Gothic",
  doc,
) = {
  //
  set text(
    lang: "jp",
    region: "JP",

    font: textfont,
    12pt,
  )
  show emph: set text(font: textfont)
  show strong: set text(font: textfont)

  set document(
    title: title,
    author: author,
    date: auto,
  )

  // \
  set page(
  paper: "a4",
  header: align(right)[
     #headtitle
  ],
  // width: auto,
  // height: auto,
  // flipped: false,
  //  margin: (left: 31.2694445mm, right: 31.2694445mm + 8em, top: 31.2044445mm, bottom: 21.3344445mm),
  // ( 31.2694445 * 2  - 3.88 - 4.23 - 1.76) / 2
  // binding: auto,
  // columns: 1,
  // fill: auto,
  numbering: "1",
  // number-align: center + bottom,
  )

  set par(
    leading: 0.85em,
    first-line-indent: 1em,
    justify: true,
    linebreaks: "simple",
  )

  set list(indent: 0.5em)
  set enum(numbering: "(1)")

  set heading(numbering: "1.")
  show heading: set text(font: headfont)
  show heading: it => {
    it
    v(-0.3em)
    par(text(size: 0pt, ""))
  }

  set outline(
    title: "目次",
    indent: 1em,
  )

  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    strong(it)
  }
  show "、": "，"
  show "。": "．"

  //math
  show math.frac: math.display
  show math.integral: math.display

  show math.equation: set text(font: ("New Computer Modern Math", textfont))
  show math.equation.where(block: false): it => {
    h(0.17em, weak: true)
    it
    h(0.17em, weak: true)
  }

  firstindent + doc
}
