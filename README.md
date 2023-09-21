# The quran package
Copyright © 2015-2020

The [`quran-de`](https://ctan.org/pkg/quran-de) package is an extension of the [`quran`](https://ctan.org/pkg/quran) LaTeX package, designed to enhance the typesetting of the Holy Quran by incorporating specific German translations. It provides support for German translations carried out by notable translators such as `Abu Rida Muhammad ibn Ahmad ibn Rassoul`, `A. S. F. Bubenheim and N. Elyas`, `Adel Theodor Khoury`, and `Amir Zaidan`.

## Sample Usage

```
\documentclass{article}

\usepackage{arabxetex}
\usepackage{quran-de}

\begin{document}

    \begin{arab}[utf]
        \quransurah[112]
    \end{arab}
    \quransurahde[112]

\end{document}
```

## Documentation
For more details, please refer to [this link](http://mirrors.ctan.org/macros/xetex/latex/quran-de/doc/quran-de-doc.pdf).


## License

[The LaTeX project public license (LPPL), version 1.3c](https://www.latex-project.org/lppl/lppl-1-3c/)

## Citation

```tex
@misc{quran,
  title={{quran}: An easy way to typeset any part of The Holy Quran},
  url={https://ctan.org/pkg/quran},
  note={Software available from https://github.com/javadr/quran},
  author={Javad Razavian},
  year={2015},
}
```