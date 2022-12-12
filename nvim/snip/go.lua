return {
  s("iferr", t("if err != nil {\
 fmt.Printf(\"there's been an error: %v\", err)\
 os.Exit(1)\
}"))
}
