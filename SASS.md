# SASS

Stands for Syntactically Awesome Style Sheets
Augments regular CSS syntax with programming concepts (e.g. variables, OO, nesting)
Ultimately, the extended stylsheets are interpreted into regular CSS (e.g. all variables are replaced, unnest, evaluated expressions end up as values)

## Variables

  $var = #123456;

## Evaluation

  darken([color], 75%)

## Nesting

Actually interpreted to two separate block definitions (& refers to the parent selector)

  elem { inside{} }

equals

    elem {}
    elem inside {}