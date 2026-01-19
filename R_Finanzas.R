library(survival)
usethis::use_git()
usethis::use_github()
system("git config --global --list")
usethis::git_sitrep()
usethis::use_git_config(user.name = "mergarejow-coder", user.email = "mergarejow@gmail.com" )

usethis::gh_token_help()

library(gitcreds)

gitcreds_set()

gitcreds_get()
usethis::use_github()
usethis::gh_token_help()
2+2

# main.R
print("Hola GitHub desde R")

usethis::use_git()
git remote -v

git remote add origin https://github.com/mergarejow-coder/Finanzas_en_r_202601.git

git add .
git commit -m "Mensaje claro del cambio"
git push

# prueba_github.R
x <- 10
y <- 20
x + y
