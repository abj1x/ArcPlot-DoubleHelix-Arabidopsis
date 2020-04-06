## ArcPlot for visualising potential local (SNP-related) RNA folding differences between 2 variant RNA sequences

## R4RNA packaged within BioConductor
## e.g.
## if (!requireNamespace("BiocManager", quietly = TRUE))
## install.packages("BiocManager")
## BiocManager::install("R4RNA")

library(R4RNA)

## one SNP variant of a 5'UTR region of an Arabidopsis gene (LHY)
## e.g. FASTA file
## >SNP_GGUGC
## UUGUGGCUGAGAUUGCUUCUGGCUUCUCUUCUUCUUCUUCCAGUCUUCUUCAGCCUAAAACAGUCUU
## CCUUCUUCUUCUUCUUCUUCUUCUUCUUCUUCUUCUUCAGUUAUCUUCUUCCUUCUUCUCUCUGUUU
## UUUAAAUUUAUUUUUAGAGAUUUUUUUUUGUUUUGCUUCCGAUUUGAUUAUUUCCGGGAACGAUGAC
## UUCUCCGGGGAGUUCCCGGUGAGAUGAUAAGUCAGAUUGCAUACUUGUCUCCUCCAUGGCUACUCUC
## AAGGGUAUAACAGUUUACAUUAUGAGCAGUUUCUAGGAUUCCUAUAACAUACUAAGAUCUCUGUUUG
## GCUGCUGAGAAACUUAUAGAAGCGAUUAACUAAAUCUUAUUAGCUCUAAAAGUUAGCAUAAAUGAUA
## CGAAUCUGGUGAUUGAUUACUGAUAUGAAGAUUUGUGAAGGUUUUGGCUGCGGUGGAUUCGUUUGGG
## UGAGGCUUUUGUGAAUAAUAAUAAAGGGAAUUCUUUUGAGUUCUGCUGGAGAAGCAGCGACUGUUUC
## ACGGUGGACUUUGAAAAGAUUUCUCUUUUGAAUUUCGCUCAUCACUCUUAUCUUAGUGUUUGUGGAU
## AAAUAUUUCUCAUAAAGUACUUUCUCCUUUGCAGUUUCUCUAGAAUCUAAAGAGGUUAUCACAACGG
## CUUUGCAAUUUGAAAACUUUCAUGUUUGGGGAGAUCAAAGAUGGUUUCUUUUUUAUACUUUACUUGU
## UAGAGAGGAUUUGAAGCAGCGAAUAGCUGCACCGGUCCUGUUAUG

## dot bracket annotation web output for sequence above from Vienna web form http://unafold.rna.albany.edu//?q=mfold/RNA-Folding-Form

dot_bracket_GGUGC<-"....((((((((......((((.................))))...))).)))))...(((((....((.((((..(((((((...........(((((....(((((.(((.((..((...(((.......................((((((((((....((((.(((.((.((((((.((((((((((((((.....((......))..))))))))..)))))))))))).))..)))...........(((.(((..(((((((...(((........)))....)))).)))..)))))).......))))....))))))))))......(((((....((((.((((.((...(((.......)))...)))))).)))))))))..........)))...)).))..))).)))))...)))))...((((((((((((((((..((((........((((((.......(((((.......((((((((.((((((.((.((..(((..(((((((...))))))).)))..))..)).)))))).)))))))).....)))))...)))))).......((((((((((((........)).)))))).))))....(((((..((.(((....))).))..)))))...))))..)))))..........)))))))))))....)))))))...)))).))..(((((((((.((.......)))))))))))......(((((.....))))).......)))))..."

## dot bracket annotation for another SNP variant

dot_bracket_AUGCA<-"(((..((((...(((((....(((((...(((((.(((..(.((((.((.(((((.(((((.(........)..............((((....(((((....(((((.(((.((..((..(((((....((((((((..........((((((((((....((((.(((.((.((((((.((((((((((((((.....((......))..))))))))..)))))))))))).))..)))...........(((.(((..(((((((...(((........)))....)))).)))..)))))).......))))....)))))))))).........))))))))....))))).((((.....))))...((((((.....))))))..................)).))..))).)))))...))))).....)))))))))))))).)).))))..((..(((..(((((.((((((........((((((((.((((((.((.((..(((..(((((((...))))))).)))..))..)).)))))).))))))))...((((.((.((((((.((......)).))).))))).)))).....................(((((..((.(((....))).))..)))))...)))))).)))))..)....((((((...((((.(((((.....))))).)))).....))))))..))..))..)..))))))))...)))))))))).))))..)))............."

## convert dot bracket format to helix dataframe
GGUGC<-viennaToHelix(dot_bracket_GGUGC,-175.46,)
AUGCA<-viennaToHelix(dot_bracket_AUGCA,-173.56,)

## compare two arcs plots
plotDoubleHelix(GGUGC,AUGCA,line=TRUE,arrow=TRUE,col="gray85",lwd=0.5)

## highlight specific nucleotide positions and distinguish by line colour
plotArc(404,125,y=0,shape="circle",col="brown3",lwd=2)
plotArc(404,436,y=0,flip=TRUE,shape="circle",col="brown3",lwd=2)
plotArc(596,618,y=0,shape="circle",col="black",lwd=2)
plotArc(596,316,y=0,flip=TRUE,shape="circle",col="black",lwd=2)
plotArc(703,65,y=0,shape="circle",col="dodgerblue1",lwd=2)
plotArc(703,248,y=0,flip=TRUE,shape="circle",col="dodgerblue1",lwd=2)

## label both sides of Arc plot
mtext("G/G/U/G/C",side=3,line=-5,at=50,col="black")
mtext("A/U/G/C/A",side=1,line=-5,at=50,col="black")

## add legend
legend(700,-240,c("37437","37245","37138"),lwd=c(2.5,2.5,2.5), col=c("brown3","black","dodgerblue1"),text.col="black",bty="n")

dev.copy(png, "ArcPlot_LHY.png", width=600, height=400)
dev.off()
