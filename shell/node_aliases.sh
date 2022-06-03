alias rn="npx react-native"


pod-install() {
  if [ ${PWD##*/} = "ios" ]
  then
    pod install $@
  else
    (cd ios && pod install $@)
  fi
}
