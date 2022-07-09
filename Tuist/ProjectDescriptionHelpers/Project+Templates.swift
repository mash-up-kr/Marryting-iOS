import ProjectDescription

extension Project {
    
  public static func make(name: String, targets: [Target]) -> Project {
    return Project(
      name: name,
      organizationName: "kr.mash-up",
      targets: targets
    )
  }
}
