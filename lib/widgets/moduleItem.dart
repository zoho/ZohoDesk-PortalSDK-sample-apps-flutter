import 'package:asap_flutter_demo/models/models.dart';
import 'package:flutter/material.dart';

class ModulesItem extends StatelessWidget {

    const ModulesItem({
        super.key,
        required this.module
    });

    final ModuleEntity module;

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: () {
                module.moduleInvoker();
            },
            child: Card(
                color: Theme.of(context).cardColor,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                elevation: 2,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(children: [
                            Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(module.name,
                                            style: Theme.of(context).textTheme.titleSmall),
                                        Wrap(
                                            children: [
                                                Text(module.desc,
                                                    style: Theme.of(context).textTheme.bodyMedium)
                                            ]
                                        )
                                    ]
                                )),
                            const Icon(Icons.arrow_forward_ios, size: 20)
                    ])
                )));
    }
}
