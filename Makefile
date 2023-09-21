.ONESHELL:

.PHONY: all
all: readme doc test cleanup

.PHONY: doc
doc:
	$(MAKE) -C doc
	cd doc || exit
	xelatex quran-de-doc
	xelatex quran-de-doc

.PHONY: test
test:
	$(MAKE) -C sample  quran-de-test.tex
	cd sample || exit
	xelatex quran-de-test
	cd .. || exit

.PHONY: cleanup
cleanup:
	$(MAKE) clean
	$(MAKE) clean -C doc -f ../Makefile
	$(MAKE) clean -C tex -f ../Makefile
	$(MAKE) clean -C sample -f ../Makefile

.PHONY: clean
clean:
	@rm -fv ./*.{aux,log,toc,idx,hd,out} ./*~

.PHONY: dev
dev:
	cd tex || exit
	sudo cp -v *.def quran-de.sty /usr/local/texlive/2023/texmf-dist/tex/xelatex/quran-de/

.PHONY: ctan
ctan:
	$(MAKE) cleanup
	mkdir -p quran-de/doc quran-de/tex
	cp -v README        quran-de
	cd tex || exit
	cp -v quran-de.sty  ../quran-de/tex
	cp -v qurantext-de*.translation.def ../quran-de/tex
	cd ../doc/ || exit
	cp -v quran-de-doc.pdf quran-de-doc.tex quran.png ../quran-de/doc
	cd ../sample || exit
	cp -v quran-de-test*    ../quran-de/doc
	cd ..
	zip -r quran-de.zip quran-de
	mv -fv quran-de.zip ..
	rm -rfv ../quran-de
	mv -fv quran-de ..

QURANDATE := $(shell grep "qurandedate{" tex/quran-de.sty | cut -d'{' -f2 | tr -d '}')
QURANVERSION := $(shell grep "qurandeversion{" tex/quran-de.sty | cut -d'{' -f2 | tr -d '}')
YEAR := "$(shell echo ${QURANDATE} | cut -d'/' -f1)"
readme-file := README

.PHONY: readme
readme:
	@echo "_____________________" > "${readme-file}"
	@echo "The quran-de package" >> "${readme-file}"
	@echo "v${QURANVERSION}" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "The package is prepared for typesetting some of German translations of the Holy Quran." >> "${readme-file}"
	@echo -e "The supported translations are done  by \`Abu Rida Muhammad ibn Ahmad ibn Rassoul\`," >> "${readme-file}"
	@echo -e "\`A. S. F. Bubenheim and N. Elyas\`, \`Adel Theodor Khoury\`, and \`Amir Zaidan\`." >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "For more information, please see the documentation." >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "Current version release date: ${QURANDATE}" >> "${readme-file}"
	@echo "___________________" >> "${readme-file}"
	@echo "Seiied-Mohammad-Javad Razvian" >> "${readme-file}"
	@echo "javadr@gmail.com" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "Copyright © 2018-${YEAR}" >> "${readme-file}"
	@echo "It may be distributed and/or modified under the LaTeX Project Public License," >> "${readme-file}"
	@echo "version 1.3c or higher (your choice). The latest version of" >> "${readme-file}"
	@echo "this license is at: http://www.latex-project.org/lppl.txt" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "This work is “author-maintained” (as per LPPL maintenance status)" >> "${readme-file}"
	@echo "by Seiied-Mohammad-Javad Razavian." >> "${readme-file}"
