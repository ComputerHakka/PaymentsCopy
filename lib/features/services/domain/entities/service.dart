import 'package:equatable/equatable.dart';

class ServiceEntity extends Equatable {
  final int? id;
  final String name;
  final double cost;
  final String description;
  final String technology;
  final String howToPay;
  final String connectionPeriod;
  final String? companyId;
  final String? photoPath;

  const ServiceEntity({
    this.id,
    required this.name,
    required this.cost,
    required this.description,
    required this.technology,
    required this.howToPay,
    required this.connectionPeriod,
    this.companyId,
    this.photoPath,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        cost,
        description,
        technology,
        howToPay,
        connectionPeriod,
        companyId,
        photoPath,
      ];
}

abstract class ServiceMock {
  static const userServices = <ServiceEntity>[
    ServiceEntity(
      name: 'Интернет',
      cost: 2000,
      description: 'Высокоскоростной интернет для вашего дома, доступный 24/7.',
      technology:
          'Оптоволоконное подключение, скорость до 1 Гбит/с, стабильное соединение',
      howToPay: 'Онлайн или на кассе любой картой',
      connectionPeriod: '3 часа в удобный для вас день',
      companyId: 'ООО Интернет Провайдер',
    ),
    ServiceEntity(
      name: 'Охранная система',
      cost: 25000,
      description: 'Современная охранная система для защиты вашего дома.',
      technology:
          'Датчики движения, видеонаблюдение, удаленный доступ через приложение',
      howToPay: 'Онлайн или на кассе любой картой',
      connectionPeriod: '1 день в удобное для вас время',
      companyId: 'ООО Охрана',
    ),
    ServiceEntity(
      name: 'Умное освещение',
      cost: 10000,
      description:
          'Система умного освещения для вашего дома с управлением через смартфон.',
      technology: 'LED лампы, автоматизация, управление через приложение',
      howToPay: 'Онлайн или на кассе любой картой',
      connectionPeriod: '4 часа в удобное для вас время',
      companyId: 'ООО Освещение',
    ),
    ServiceEntity(
      name: 'Видеонаблюдение',
      cost: 18000,
      description:
          'Установка системы видеонаблюдения для безопасности вашего дома.',
      technology:
          'Камеры высокого разрешения, ночное видение, запись и хранение видео',
      howToPay: 'Онлайн или на кассе любой картой',
      connectionPeriod: '5 часов в любой для вас день',
      companyId: 'ООО Видеонаблюдение',
    ),
  ];

  static const anotherServices = <ServiceEntity>[
    ServiceEntity(
      name: 'Питьевые системы',
      cost: 15000,
      description:
          'Установка наших питьевых систем в домах делает воду доступной для всех жильцов. Они могут получать чистую воду прямо у себя дома или в обществ',
      technology:
          'Очищаем воду от механических примесей, убираем железо и соли жесткости, получаем воду для технических нужд, Получаем чистую воду',
      howToPay: 'Онлайн или на кассе любой картой',
      connectionPeriod: '5 часов в любой для вас день',
      companyId: 'ООО Название компании',
    ),
    ServiceEntity(
      name: 'Система отопления',
      cost: 50000,
      description: 'Эффективная система отопления для комфортного проживания.',
      technology: 'Инфракрасные обогреватели, программируемые термостаты',
      howToPay: 'Онлайн или на кассе любой картой',
      connectionPeriod: '2 дня в удобное для вас время',
      companyId: 'ООО Отопление',
    ),
    ServiceEntity(
      name: 'Умные замки',
      cost: 12000,
      description: 'Установка умных замков для безопасности вашего дома.',
      technology: 'Биометрические замки, управление через смартфон',
      howToPay: 'Онлайн или на кассе любой картой',
      connectionPeriod: '6 часов в удобное для вас время',
      companyId: 'ООО Замки',
    ),
    ServiceEntity(
      name: 'Климат-контроль',
      cost: 30000,
      description:
          'Система климат-контроля для поддержания оптимальной температуры в доме.',
      technology: 'Умные кондиционеры, увлажнители, вентиляция',
      howToPay: 'Онлайн или на кассе любой картой',
      connectionPeriod: '1 день в удобное для вас время',
      companyId: 'ООО Климат',
    ),
    ServiceEntity(
      name: 'Домашний кинотеатр',
      cost: 45000,
      description:
          'Установка домашнего кинотеатра для качественного просмотра фильмов.',
      technology: 'Проектор, экран, система объемного звука',
      howToPay: 'Онлайн или на кассе любой картой',
      connectionPeriod: '1 день в удобное для вас время',
      companyId: 'ООО Кинотеатр',
    ),
    ServiceEntity(
      name: 'Энергосберегающая система',
      cost: 35000,
      description: 'Система для экономии электроэнергии в вашем доме.',
      technology:
          'Солнечные панели, умные розетки, энергоэффективные устройства',
      howToPay: 'Онлайн или на кассе любой картой',
      connectionPeriod: '2 дня в удобное для вас время',
      companyId: 'ООО Энергия',
    ),
    ServiceEntity(
      name: 'Умный сад',
      cost: 25000,
      description: 'Автоматизированная система полива и ухода за садом.',
      technology: 'Датчики влажности, автоматические поливочные системы',
      howToPay: 'Онлайн или на кассе любой картой',
      connectionPeriod: '5 часов в любой для вас день',
      companyId: 'ООО Садоводство',
    ),
    ServiceEntity(
      name: 'Система безопасности',
      cost: 40000,
      description: 'Комплексная система безопасности для вашего дома.',
      technology: 'Сигнализация, датчики дыма и газа, видеонаблюдение',
      howToPay: 'Онлайн или на кассе любой картой',
      connectionPeriod: '1 день в удобное для вас время',
      companyId: 'ООО Безопасность',
    ),
    ServiceEntity(
      name: 'Умная мебель',
      cost: 20000,
      description: 'Современная умная мебель для вашего дома.',
      technology: 'Регулируемые столы и стулья, встроенные зарядные устройства',
      howToPay: 'Онлайн или на кассе любой картой',
      connectionPeriod: '4 часа в удобное для вас время',
      companyId: 'ООО Мебель',
    ),
    ServiceEntity(
      name: 'Мультирум',
      cost: 30000,
      description:
          'Система мультирум для воспроизведения музыки во всех комнатах.',
      technology: 'Беспроводные колонки, управление через приложение',
      howToPay: 'Онлайн или на кассе любой картой',
      connectionPeriod: '5 часов в любой для вас день',
      companyId: 'ООО Мультирум',
    ),
  ];
}
