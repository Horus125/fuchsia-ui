May 8, 2017 -> https://www.youtube.com/watch?v=_7rRK4S9uk0
instructions:
  https://fossbytes.com/google-fuchsia-os-open-source-picture-first-look-armadillo-ui/
  mkdir apps
  mkdir lib
  mkdir third_party
  cd apps
  git clone https://github.com/iambenqazy/sysui.git
  mkdir modules
  cd modules
  git clone https://github.com/rafaelklaessen/modules-common.git common
  cd ../../lib
  mkdir -p widgets/packages/ <= skopiuj tu do folder public/dart/widgets z git clone https://github.com/fuchsia-mirror/topaz.git (commit 16th), a do roota folder tools z topaz repo (commit MASTER~1)
  cd ../third_party
  git clone https://fuchsia.googlesource.com/third_party/dart-pkg
  cd ..
  ./update_flutter.sh
  ./fix_environment.sh
  source sysui/tools/environment.sh
  cd sysui/armadillo; flutter run

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

important dart-pkg modules:
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
