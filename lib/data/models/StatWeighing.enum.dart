enum StatWeighing {
  allTiers,
  maxOne,
  maxTwo,
  maxThree,
}

StatWeighing? getStatWeighingFromString(String statusAsString) {
  for (StatWeighing element in StatWeighing.values) {
    if (element.toString() == statusAsString) {
      return element;
    }
  }
  return null;
}
