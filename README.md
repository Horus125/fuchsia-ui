# Fuchsia UI - resources and instructions for building armadillo
Below you can find links to forks of deleted repos, which were needed for building latest armadillo apk from source. Unfortunately I haven't managed to find a copy of lib.widgets repo, but I included instructions for getting necessary files from topaz

Here is a video of armadillo apk you can build (included in an article I based my instructions on, written in May, 2017) https://www.youtube.com/watch?v=_7rRK4S9uk0)

## Screenshots
<p align="center">
  <img src="screenshots/Screenshot_20190406-010625.jpg" width="350" title="armadillo" alt="image1">
  <img src="screenshots/Screenshot_20190406-010638.jpg" width="350" title="suggestions" alt="image2">
  <img src="screenshots/Screenshot_20190406-010650.jpg" width="350" title="quick settings" alt="image3">
  <img src="screenshots/Screenshot_20190406-010735.jpg" width="350" title="opened app" alt="image5">
  <img src="screenshots/Screenshot_20190406-010713.jpg" width="350" title="recent apps" alt="image4">
  
  <img src="screenshots/Screenshot_20190406-010725.jpg" width="350" title="tab view" alt="image6">
</p>



## Instructions
  These instructions work with linux shell, run them in fuchsia-ui directory after git-cloning.
  (I'll make a simple script soon)
  ```
  mkdir apps
  mkdir lib
  mkdir third_party
  cd apps
  git clone https://github.com/iambenqazy/sysui.git
  cd sysui; git checkout 18464f7; cd .. //this is the latest armadillo, for older see "important sysui commits" below
  mkdir modules
  cd modules
  git clone https://github.com/rafaelklaessen/modules-common.git common
  //this is the latest modules-common version, for older see "important modules commits" below
  cd ../../third_party
  git clone https://fuchsia.googlesource.com/third_party/dart-pkg
  cd dart-pkg; git checkout 58bd2338; cd ..
  //this is the latest dart-pkg version that works, for older see "important dart-pkg commits" below
  cd ../..
  ```
  
  Now the trickiest part, we'll clone the topaz mirror from github and go one commit back to recover deleted files. Then we'll copy topaz/tools folder to our root fuchsia-ui, after that we'll change topaz repo to commit 38d060a65 (16th in my list) and copy topaz/public/dart/widgets folder to fuchsia-ui/widgets/packages, so that the end path is: fuchsia-ui/widgets/packages/widgets. I'll try to find a better solution, but this workaround works
  ```
  mkdir -p lib/widgets/packages
  git clone https://github.com/fuchsia-mirror/topaz.git
  cd topaz; git checkout HEAD~1; cp -r tools ..
  git checkout 38d060a65; cp -r public/dart/widgets ../apps/lib/widgets/packages/
  cd ..
  ```
  
  Finally we download the appropriate flutter version (pretty old but works, default is last working, you can change the flutter version commit in FLUTTER_VERSION file) and build the app
  ```
  ./update_flutter.sh
  ./fix_environment.sh
  cd apps/sysui; source tools/environment.sh //you have to run source command from apps/sysui, otherwise it won't work!
  cd armadillo; flutter run
  ```
## Important commits
```
important sysui commits:
  1 ==> 107cca7faacffc330e45e3311808557ec37a4c10:
    last working commit before cli_util error
  2 ==> 10c0a5d112984e657e5a329e23c27c46a8e32cae:
    flutter sync that creates cli_util error, fixed by either commenting out the dev_overrides or changing linter version to 0.2.29 and adding cli_util: any in third_party/flutter/packages/flutter_tools/pubspec.yaml
  3 ==> 95aa7704c15e0b9ee506de3a0453be85c140637a:
    last working commit before the errors with error.dart and linter
  4 ==> cb2203c3f3fa3289b43a9327842e53fe5e8a62aa
    flutter sync that creates errors with error.dart and linter, if solved earlier bugs with first method now use the second
  5 ==> 8a5d2b9:
    last working commit before introducing modules
  6 ==> 8e75450:
    introduced modules, apart from previous fixes clone "6 compatible" commit of modules-common
  7 ==> 96d1e4c:
    last working before app 'map' bugs
  8 ==> 38b792f:
    error with suggestion list, fixed in later commits
  9 ==> c612eec:
    NEW FLUTTER LOCATION: from sysui/third_party/flutter to sysui/../lib/flutter, had to change install_flutter.sh in tools (which is also deleted in this commit)
  10 ==> c75da19:
    works only with 10th version of flutter, earlier patches still apply
  11 ==> b90e74e:
    last commit before moving sysui and modules to apps
  12 ==> e996cba:
    moving sysui and modules to apps, had to change dir struct and tools/environment.sh
  13 ==> 13fa71c:
    added flux and third_party dart-pkg
  14 ==> 400e6a6, 174d3c1
  15 ==> 72eab6e:
    great! also earlier bugs don't exist now!
  16 ==> 18464f7: moved modules to modules/common! had to fix environment and copy public/dart/widgets to lib/widgets/packages/ from topaz repo, also copy tools directory from topaz repo to root
  

important modules commits:
  6 ==> d7c9f7e:
    first commit i checked that works with 6 version of sysui
  7 ==> 599c182:
    works with 7sth sysui
  12 ==> 0731cb6:
    works with 12th sysui
  13 ==> 0365e69:
    works with 13th
  14 ==> ed6126d:
    works with 14th
  15 ==> f99cc75:
    works with 15th
  16 ==> master

important dart-pkg commits:
  13 ==> c2ade30:
    works with 13th
  14 ==> 7685bf43:
    works with 14th
  15 ==> 7f836ad
    works with 15th
  16 ==> 58bd2338 

important flutter commits:
  9 ==> c77798a384a88b0dad98ea4a3f79dae3f49a984f
  10 ==> d39eb84ac44fc58f3057753140b88e431ab7f37e
  14 ==> 69bcfc082f25d3e56d09e0b31110165b131b12fb
  15 ==> c32fa70d9dbf7909224debbae35eb78ac60eb42b
  16 ==> 9f510ebdc991ef96525c5e268a94805c1370e8b2
         bbcfb8d51ab12a51f5bc7cedc6d6725b06fac2dc

important topaz commits:
  16 ==> 38d060a65
```
