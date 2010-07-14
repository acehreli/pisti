all: pisti

PROGRAM_DIZINI=bin

KAYNAKLAR=\
    pisti/anlatan.d \
    pisti/görevli.d \
    pisti/hakem.d \
    pisti/kart.d \
    pisti/masa.d \
    pisti/oyuncu.d \
    pisti/çizici.d \
    pisti/pisti.d \

SECENEKLER=-w -wi

OLUSTURMA_KOMUTU=dmd ${KAYNAKLAR} ${SECENEKLER} -of$@

${PROGRAM_DIZINI}:
	mkdir -p $@

${PROGRAM_DIZINI}/test: ${KAYNAKLAR} Makefile ${PROGRAM_DIZINI}
	${OLUSTURMA_KOMUTU} -unittest
	./$@

pisti: ${PROGRAM_DIZINI}/pisti
${PROGRAM_DIZINI}/pisti: ${PROGRAM_DIZINI}/test
	${OLUSTURMA_KOMUTU}

.PHONY: temizle clean
temizle clean:
	rm -rf ${PROGRAM_DIZINI}

.PHONY: 
dene:
	pisti
	/bin/./pisti
