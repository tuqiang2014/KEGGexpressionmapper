# KEGGexpressionMapper v0.2b
The KEGGexpressionMapper allows to visualize the expression of genes or the abundances of proteins in any given species for all KEGG pathways that contain an KEGG ortholog. Therefore, the user needs to provide a mapping to the expression information (expression_mapping_file), a mapping to the KEGG orthologous file (kegg_to_gene_mapping_file), and a mapping of the selected gene_candidates (gene_candidate_file) which can represent e.g. differentially expressed genes. When a user has provided all these information, at first the KEGGexpressionMapper makes a lookup to determine 
pathways associated with the KEGG orthologs. Following that, for each pathway it visualizes the expression or protein abundancies by modifying the PNG visualisations which is provided in KEGG by using the R-package PNG.

## How to run it and install it

### Requirements
KEGGexpressionMapper was run and tested under Linux distribution and requires the tool 'wget' to be installed.
For Windows it is necessary to install wget and set the system path, so we so far recommend the tool to be used
in Linux only.

### Step-1: Get release from Github
wget https://github.com/nthomasCUBE/KEGGexpressionmapper/archive/v0.2.tar.gz
mv v0.2.tar.gz KEGGexpressionMapper.tar.gz

### Step-2: install it in R
open R

```bash
install.packages('png')
install.packages('KEGGexpressionMapper.tar.gz')

library(KEGGexpressionMapper)
KEGGexpressionMapper(gene_desc = "Use_case2/DEG.tab", gene_kegg = "Use_case2/KEGG.tab", gene_expr = "Use_case2/EXPRESSION.tab", is_timeseries = FALSE, excel = NA)
```
You need to refer to the absolute or the relative path of each parameter.

### Alternative: Running demo data
If you want the run the demo example, please copy the example data to your current directory: 
- wget https://github.com/nthomasCUBE/KEGGexpressionmapper/files/1100610/example.zip
Then, it is possible to calculate the clams data as described in our manuscript.
- KEGGexpressionMapper()

## Parameter explanation
### Expression_Mapping_file
Parameter: Expression_Mapping_file contains the genes in the first row, followed by the expression of each conditions. The values need to be separated by a tabulator (!).

The file should have the following structure:
```bash
Gene conditionA conditionB conditionC conditionD
Gene1 1 3 5 10
Gene2 20  5 3 5
```
Gene1 and Gene2 represent the gene identifier. '1' describes the expression in the first condition, '3' the expression in the second condition, '5' the expression in the third condition and '10' the expresion in the fourth condition.

### Kegg_to_gene_mapping_file
Parameter: Kegg_to_gene_mapping_file contains the mapping of genes to the KEGG orthologous.
The file should have the following structure and separated by a tabulatur (!):
```bash
Gene  KEGG_orthologous
Gene1 KO111
Gene2 KO22
```
Gene1 has the KEGG orthologous gene assignment KO111 and Gene2 the KEGG orthologous gene KO22.

### Gene_candidate_file 
Parameter: gene_candidate_file contains the genes, that should be highlighted in the expression-informed visualisation.
The file should have the following structure
```bash
Gene
Gene1
Gene11
Gene55
```
Gene1, Gene11 and Gene55 are then highlighted in the expression-informed KEGG pathway visualisations.

## Example
We have chosen as example data the endosymbiont of the bivalve Loripes orbiculatus and previously calculated KEGG assignments
with the help of the KAAST server.  All the three relevant files are stored in the example bin directory.

### Color interpretation

The colors shown in the diagram represent the [0,0.25], [0.25,0,50], [0.50, 0.75] and [0.75,1.00] quantile by considering
only values that are greater 0. The colors shown are blue, green, yellow, oragen, red.

## Help line
Help:
For further requests and information, the following email can be used: thomas.nussbaumer < AT > univie.ac.at .



