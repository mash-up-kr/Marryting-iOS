import ProjectDescription

extension Project {
    
  public static func make(name: String, targets: [Target], packages: [Package] = []) -> Project {
    return Project(
      name: name,
      organizationName: "kr.mash-up",
      packages: packages,
      targets: targets
    )
  }
}
