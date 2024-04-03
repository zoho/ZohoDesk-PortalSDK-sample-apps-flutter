class ModuleEntity {
    const ModuleEntity({required this.name, required this.desc, required this.moduleInvoker});

    final String name;
    final String desc;
    final Function moduleInvoker;
}
