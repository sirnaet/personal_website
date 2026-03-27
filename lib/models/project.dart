class Project {
  final String title;
  final String description;
  final List<String> techStack;
  final String duration;
  final String? githubUrl;
  final String? githubLabel;
  final String? demoUrl;
  final String? demoLabel;

  const Project({
    required this.title,
    required this.description,
    required this.techStack,
    required this.duration,
    this.githubUrl,
    this.githubLabel,
    this.demoUrl,
    this.demoLabel,
  });
}
