import 'package:cabeleleila/app/common/widget/appbar_custom.dart';
import 'package:cabeleleila/app/common/widget/service_salon_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  final List<SalonService> services = [
    SalonService(
      name: 'Corte de cabelo',
      description: 'Serviço de corte, modelagem e finalização dos cabelos.',
      price: 80,
    ),
    SalonService(
      name: 'Coloração de cabelo',
      description:
          'Serviço de mudança de cor dos cabelos, podendo ser tintura, mechas, reflexos, entre outros.',
      price: 135,
    ),
    SalonService(
      name: 'Tratamentos capilares',
      description:
          'Serviços que visam a saúde e beleza dos cabelos, como hidratação, reconstrução e cauterização',
      price: 180,
    ),
    SalonService(
      name: 'Manicure e pedicure',
      description:
          'Coloração de cabelos.serviços de cuidados com as unhas das mãos e dos pés, como corte, lixamento, esmaltação, entre outros.',
      price: 45,
    ),
    SalonService(
      name: 'Maquiagem',
      description:
          'Serviço de maquiagem para diversas ocasiões, como festas, eventos e casamentos.',
      price: 135,
    ),
    SalonService(
      name: 'Depilação',
      description:
          'Serviço de remoção de pelos, podendo ser feita com cera quente, fria ou método de fotodepilação.',
      price: 150,
    ),
    SalonService(
      name: 'Design de sobrancelhas',
      description:
          'Serviço de cuidados com as sobrancelhas, como modelagem, tintura e hena',
      price: 60,
    ),
    SalonService(
      name: 'Tratamentos faciais',
      description:
          'Serviços que visam a saúde e beleza da pele do rosto, como limpeza de pele, máscaras, peeling, entre outros.',
      price: 190,
    ),
    SalonService(
      name: 'Massagem corporal',
      description:
          'serviço de massagem para relaxamento, alívio de dores musculares, redução de celulite, entre outros.',
      price: 280,
    ),
  ];

  @override
  bool get wantKeepAlive => true;

  AppBarCustom _appBarHome() => const AppBarCustom(
        title: 'Serviços Disponíveis',
      );

  ListView _bodyHome() {
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return SalonServiceCard(service: service);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: _appBarHome(),
      body: _bodyHome(),
    );
  }
}
