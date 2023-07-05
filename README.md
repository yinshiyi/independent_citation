# independent_citation
1. use the submodule and target author google scholar profile to generate the rawdata and store in `/data`
2. use `grep_*.sh` to produce csv files of links
3. run `chrome.py` to generate final output in `/output`

# background

for US immigration, most law firm will ask independent citations numbers, not the google scholar numbers. 
there are two types of definations of self-citation (non-independent citation), which way is preferred to count is still an active area of debate.

1. the paper citing my paper cannot have my name on it, excluding self-citation by me, (author centric model) 
Kacem, A., Flatt, J.W. & Mayr, P. Tracking self-citations in academic publishing. Scientometrics 123, 1157–1165 (2020). https://doi.org/10.1007/s11192-020-03413-9 

2. the paper citing my paper cannot have any overlap of any names, excluding self-citation by me and co-authors, (article centric model)
Ioannidis, J. P. A., Baas, J., Klavans, R., & Boyack, K. W. (2019). A standardized citation metrics author database annotated for scientific field. PLoS Biology,17(8), e3000384. https://doi.org/10.1371/journal.pbio.3000384.

In my expereinces, as of 2023, most will either ask for > 200 total citation or 150 independent (type 2 method) for EB1B.
