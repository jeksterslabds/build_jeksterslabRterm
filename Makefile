.PHONY: all clean

all :
	Rscript "deploy.R"
	Rscript -e 'rmarkdown::render("deploy.R")'
	-git add --all
	-git commit -m "Automatic build."
	-git push origin master

clean :
	Rscript reset_user_lib.R
