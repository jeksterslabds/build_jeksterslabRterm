.PHONY: all clean

all :
	Rscript "deploy.R"
	Rscript -e 'rmarkdown::render("deploy.R")'

clean :
	Rscript reset_user_lib.R
