import 'package:surf_flutter_cources/fragnence_app/data/entity/brand.dart';
import 'package:surf_flutter_cources/fragnence_app/data/entity/enum/gender_type.dart';
import 'package:surf_flutter_cources/fragnence_app/data/entity/enum/perfume_type.dart';
import 'package:surf_flutter_cources/fragnence_app/data/entity/note.dart';
import 'package:surf_flutter_cources/fragnence_app/data/entity/note_peramide.dart';
import 'package:surf_flutter_cources/fragnence_app/data/entity/perfume.dart';

List<Perfume> perfumes = [
  Perfume(
    title: "Chanel No. 5",
    brand: Brand(
      name: "Chanel",
      description: "A luxurious fragrance brand",
      logo: "assets/images/frag/brand/chanel.jpg",
    ),
    country: "France",
    price: 150,
    volume: [50, 100],
    genderType: GenderType.female,
    perfumeType: PerfumeType.edp,
    year: 1921,
    image: "assets/images/frag/parfume_image/chanel_5.jpg",
    notes: [
      NotePeramide(
        topNotes: [
          Note(
              name: "Альдегиды",
              image: "assets/images/frag/parfume_note/Aldehydes.jpg"),
          Note(
              name: "Нероли",
              image: "assets/images/frag/parfume_note/Neroli.jpg"),
        ],
        middleNotes: [
          Note(
              name: "Жасмин",
              image: "assets/images/frag/parfume_note/Jasmine.jpg"),
          Note(name: "Роза", image: "assets/images/frag/parfume_note/Rose.jpg"),
        ],
        baseNotes: [
          Note(
              name: "Сандал",
              image: "assets/images/frag/parfume_note/Sandalwood.jpg"),
          Note(
              name: "Ваниль",
              image: "assets/images/frag/parfume_note/Vanilla.jpg"),
        ],
      ),
    ],
  ),
  Perfume(
    title: "Sauvage",
    brand: Brand(
      name: "Dior",
      description: "Elegant and luxurious fragrances",
      logo: "assets/images/frag/brand/dior.jpg",
    ),
    country: "France",
    price: 120,
    volume: [60, 100],
    genderType: GenderType.male,
    perfumeType: PerfumeType.edt,
    year: 2015,
    image: "assets/images/frag/parfume_image/DiorSauvage.jpg",
    notes: [
      NotePeramide(
        topNotes: [
          Note(
            name: "Перец",
            image: "assets/images/frag/parfume_note/Pepper.jpg",
          ),
          Note(
            name: "Бергамот",
            image: "assets/images/frag/parfume_note/Bergamot.jpg",
          ),
        ],
        middleNotes: [
          Note(
            name: "Лаванда",
            image: "assets/images/frag/parfume_note/Lavender.jpg",
          ),
          Note(
            name: "Ветивер",
            image: "assets/images/frag/parfume_note/Vetiver.jpg",
          ),
        ],
        baseNotes: [
          Note(
            name: "Амброксан",
            image: "assets/images/frag/parfume_note/Ambroxan.jpg",
          ),
          Note(
            name: "Кедр",
            image: "assets/images/frag/parfume_note/Cedarwood.jpg",
          ),
        ],
      ),
    ],
  ),
  Perfume(
    title: "Eros",
    brand: Brand(
      name: "Versace",
      description: "Italian luxury and vibrant scents",
      logo: "assets/images/frag/brand/Versace.jpg",
    ),
    country: "Italy",
    price: 90,
    volume: [50, 100],
    genderType: GenderType.male,
    perfumeType: PerfumeType.edp,
    year: 2012,
    image: "assets/images/frag/parfume_image/VersaceEros.jpg",
    notes: [
      NotePeramide(
        topNotes: [
          Note(name: "Мята", image: "assets/images/frag/parfume_note/Mint.jpg"),
          Note(
              name: "Зеленое яблоко",
              image: "assets/images/frag/parfume_note/GreenApple.jpg"),
        ],
        middleNotes: [
          Note(
              name: "Бобы тонка",
              image: "assets/images/frag/parfume_note/TonkaBean.jpg"),
          Note(
              name: "Герань",
              image: "assets/images/frag/parfume_note/Geranium.jpg"),
          Note(
              name: "Амброксан",
              image: "assets/images/frag/parfume_note/Ambroxan.jpg"),
        ],
        baseNotes: [
          Note(
              name: "Ваниль",
              image: "assets/images/frag/parfume_note/Vanilla.jpg"),
          Note(
              name: "Кедр",
              image: "assets/images/frag/parfume_note/Cedarwood.jpg"),
          Note(
              name: "Ветивер",
              image: "assets/images/frag/parfume_note/Vetiver.jpg"),
        ],
      ),
    ],
  ),
  Perfume(
    title: "Bloom",
    brand: Brand(
      name: "Gucci",
      description: "Exquisite and fresh Italian perfumes",
      logo: "assets/images/frag/brand/Gucci.jpg",
    ),
    country: "Italy",
    price: 130,
    volume: [30, 50, 100],
    genderType: GenderType.female,
    perfumeType: PerfumeType.edp,
    year: 2017,
    image: "assets/images/frag/parfume_image/GucciBloom.jpg",
    notes: [
      NotePeramide(
        topNotes: [
          Note(
              name: "Жасмин",
              image: "assets/images/frag/parfume_note/Jasmine.jpg"),
        ],
        middleNotes: [
          Note(
              name: "Тубероза",
              image: "assets/images/frag/parfume_note/Tuberose.jpg"),
        ],
        baseNotes: [
          Note(
              name: "Квисквалис индийский",
              image: "assets/images/frag/parfume_note/Quisqualisindica.jpg"),
        ],
      ),
    ],
  ),
  Perfume(
    title: "Man in Black",
    brand: Brand(
      name: "Bvlgari",
      description: "Italian luxury with a warm, spicy touch",
      logo:
          "https://upload.wikimedia.org/wikipedia/commons/3/32/Bvlgari_logo.svg",
    ),
    country: "Italy",
    price: 130,
    volume: [60, 100],
    genderType: GenderType.male,
    perfumeType: PerfumeType.edp,
    year: 2014,
    image: "assets/images/frag/parfume_image/ManinBlack.jpg",
    notes: [
      NotePeramide(
        topNotes: [
          Note(
            name: "Перец",
            image: "assets/images/frag/parfume_note/Pepper.jpg",
          )
        ],
        middleNotes: [
          Note(
            name: "Бобы тонка",
            image: "assets/images/frag/parfume_note/TonkaBean.jpg",
          )
        ],
        baseNotes: [
          Note(
            name: "Амброксан",
            image: "assets/images/frag/parfume_note/Ambroxan.jpg",
          )
        ],
      ),
    ],
  ),
  Perfume(
    title: "Light Blue",
    brand: Brand(
      name: "Dolce & Gabbana",
      description:
          "A refreshing and lively scent reminiscent of the Mediterranean",
      logo:
          "https://upload.wikimedia.org/wikipedia/commons/3/3b/Dolce_%26_Gabbana_logo.svg",
    ),
    country: "Italy",
    price: 95,
    volume: [25, 50, 100],
    genderType: GenderType.female,
    perfumeType: PerfumeType.edt,
    year: 2001,
    image: "assets/images/frag/parfume_image/LightBlue.jpg",
    notes: [
      NotePeramide(
        topNotes: [
          Note(
              name: "Зеленое яблоко",
              image: "assets/images/frag/parfume_note/GreenApple.jpg")
        ],
        middleNotes: [
          Note(
              name: "Жасмин",
              image: "assets/images/frag/parfume_note/Jasmine.jpg")
        ],
        baseNotes: [
          Note(
              name: "Кедр",
              image: "assets/images/frag/parfume_note/Cedarwood.jpg")
        ],
      ),
    ],
  ),
  Perfume(
    title: "La Vie Est Belle",
    brand: Brand(
      name: "Lancome",
      description:
          "A sweet, floral fragrance that celebrates life and happiness",
      logo: "assets/images/frag/brand/Lancome.jpg",
    ),
    country: "France",
    price: 130,
    volume: [50, 75, 100],
    genderType: GenderType.female,
    perfumeType: PerfumeType.edp,
    year: 2012,
    image: "assets/images/frag/parfume_image/LancomeLaVieEstBelle.jpg",
    notes: [
      NotePeramide(topNotes: [
        Note(
            name: "Черная смородина",
            image: "assets/images/frag/parfume_note/Blackcurrant.jpg"),
        Note(name: "Груша", image: "assets/images/frag/parfume_note/Pear.jpg"),
      ], middleNotes: [
        Note(
            name: "Цветок апельсина",
            image: "assets/images/frag/parfume_note/Orangeblossom.jpg"),
        Note(
            name: "Жасмин",
            image: "assets/images/frag/parfume_note/Jasmine.jpg"),
        Note(name: "Ирис", image: "assets/images/frag/parfume_note/Iris.jpg"),
      ], baseNotes: [
        Note(
            name: "Ваниль",
            image: "assets/images/frag/parfume_note/Vanilla.jpg"),
        Note(
            name: "Бобы тонка",
            image: "assets/images/frag/parfume_note/TonkaBean.jpg"),
        Note(
            name: "Пачули",
            image: "assets/images/frag/parfume_note/Patchouli.jpg"),
        Note(
            name: "Пралине",
            image: "assets/images/frag/parfume_note/Praline.jpg"),
      ]),
    ],
  ),
  Perfume(
    title: "By the Fireplace",
    brand: Brand(
      name: "Maison Margiela",
      description: "Warm, smoky fragrance inspired by the scent of a fireplace",
      logo: "assets/images/frag/brand/MaisonMargiela.jpg",
    ),
    country: "France",
    price: 125,
    volume: [50, 100],
    genderType: GenderType.unisex,
    perfumeType: PerfumeType.edt,
    year: 2015,
    image: "assets/images/frag/parfume_image/MaisonMargielaBytheFireplace.jpg",
    notes: [
      NotePeramide(topNotes: [
        Note(
            name: "Розовый перец",
            image: "assets/images/frag/parfume_note/Pinkpepper.jpg"),
        Note(
            name: "Цветок апельсина",
            image: "assets/images/frag/parfume_note/Orangeblossom.jpg"),
        Note(
            name: "Гвоздика",
            image: "assets/images/frag/parfume_note/Carnation.jpg"),
      ], middleNotes: [
        Note(
            name: "Можжевельник",
            image: "assets/images/frag/parfume_note/Tuberose.jpg"),
        Note(
            name: "Каштан",
            image: "assets/images/frag/parfume_note/Chestnut.jpg"),
        Note(
            name: "Гуаяк",
            image: "assets/images/frag/parfume_note/Juniper.jpg"),
      ], baseNotes: [
        Note(
            name: "Ваниль",
            image: "assets/images/frag/parfume_note/Vanilla.jpg"),
        Note(
            name: "Кашмеран",
            image: "assets/images/frag/parfume_note/Cashmeran.jpg"),
        Note(
            name: "Перуанский бальзам",
            image: "assets/images/frag/parfume_note/PeruvianBalsam.jpg"),
      ]),
    ],
  ),
  Perfume(
    title: "Aventus",
    brand: Brand(
      name: "Creed",
      description: "A legendary fragrance known for its fruity and smoky notes",
      logo: "assets/images/frag/parfume_image/CreedAventus.jpg",
    ),
    country: "France",
    price: 325,
    volume: [50, 100],
    genderType: GenderType.male,
    perfumeType: PerfumeType.edp,
    year: 2010,
    image: "assets/images/frag/parfume_image/CreedAventus.jpg",
    notes: [
      NotePeramide(topNotes: [
        Note(
            name: "Бергамот",
            image: "assets/images/frag/parfume_note/Bergamot.jpg"),
        Note(
            name: "Зеленое яблоко",
            image: "assets/images/frag/parfume_note/GreenApple.jpg"),
        Note(name: "Лимон", image: "assets/images/frag/parfume_note/Lemon.jpg"),
        Note(
            name: "Розовый перец",
            image: "assets/images/frag/parfume_note/Pinkpepper.jpg"),
        Note(
            name: "Черная смородина",
            image: "assets/images/frag/parfume_note/Blackcurrant.jpg"),
      ], middleNotes: [
        Note(
            name: "Жасмин",
            image: "assets/images/frag/parfume_note/Jasmine.jpg"),
        Note(
            name: "Пачули",
            image: "assets/images/frag/parfume_note/Patchouli.jpg"),
        Note(
            name: "Ананас",
            image: "assets/images/frag/parfume_note/Pineapple.jpg"),
      ], baseNotes: [
        Note(name: "Мускус", image: "assets/images/frag/parfume_note/Musk.jpg"),
        Note(
            name: "Кедр",
            image: "assets/images/frag/parfume_note/Cedarwood.jpg"),
        Note(
            name: "Дубовый мох",
            image: "assets/images/frag/parfume_note/Oakmoss.jpg"),
        Note(
            name: "Амброксан",
            image: "assets/images/frag/parfume_note/Ambroxan.jpg"),
        Note(
            name: "Ветивер", image: "assets/images/frag/parfume_note/Musk.jpg"),
      ]),
    ],
  ),
  Perfume(
    title: "One Gold",
    brand: Brand(
      name: "Calvin Klein",
      description:
          "Calvin Klein — легендарный американский бренд, известный своей минималистичной эстетикой и культовыми ароматами.",
      logo: "assets/images/frag/brand/CalvinKlein.jpg",
    ),
    country: "USA",
    price: 70,
    volume: [50, 100, 200],
    genderType: GenderType.unisex,
    perfumeType: PerfumeType.edt,
    year: 2016,
    image: "assets/images/frag/parfume_image/CKOneGold.jpg",
    notes: [
      NotePeramide(topNotes: [
        Note(name: "Инжир", image: "assets/images/frag/parfume_note/Fig.jpg"),
        Note(
            name: "Бергамот",
            image: "assets/images/frag/parfume_note/Bergamot.jpg"),
        Note(
            name: "Шалфей",
            image: "assets/images/frag/parfume_note/Chamomile.jpg"),
      ], middleNotes: [
        Note(
            name: "Нероли",
            image: "assets/images/frag/parfume_note/Neroli.jpg"),
        Note(
            name: "Жасмин",
            image: "assets/images/frag/parfume_note/Jasmine.jpg"),
        Note(
            name: "Фиалка",
            image: "assets/images/frag/parfume_note/Violet.jpg"),
      ], baseNotes: [
        Note(
            name: "Ветивер",
            image: "assets/images/frag/parfume_note/Vetiver.jpg"),
        Note(
            name: "Гуаяк",
            image: "assets/images/frag/parfume_note/Juniper.jpg"),
        Note(
            name: "Пачули",
            image: "assets/images/frag/parfume_note/Patchouli.jpg"),
      ]),
    ],
  ),
];

List<Brand> brands = [
  Brand(
    name: "Chanel",
    description: "A luxurious fragrance brand",
    logo: "assets/images/frag/brand/chanel.jpg",
  ),
  Brand(
    name: "Dior",
    description: "Elegant and luxurious fragrances",
    logo: "assets/images/frag/brand/dior.jpg",
  ),
  Brand(
    name: "Versace",
    description: "Italian luxury and vibrant scents",
    logo: "assets/images/frag/brand/Versace.jpg",
  ),
  Brand(
    name: "Gucci",
    description: "Exquisite and fresh Italian perfumes",
    logo: "assets/images/frag/brand/Gucci.jpg",
  ),
  Brand(
    name: "Bvlgari",
    description: "Italian luxury with a warm, spicy touch",
    logo:
        "https://upload.wikimedia.org/wikipedia/commons/3/32/Bvlgari_logo.svg",
  ),
  Brand(
    name: "Dolce & Gabbana",
    description:
        "A refreshing and lively scent reminiscent of the Mediterranean",
    logo:
        "https://upload.wikimedia.org/wikipedia/commons/3/3b/Dolce_%26_Gabbana_logo.svg",
  ),
  Brand(
    name: "Lancome",
    description: "A sweet, floral fragrance that celebrates life and happiness",
    logo: "assets/images/frag/brand/Lancome.jpg",
  ),
  Brand(
    name: "Maison Margiela",
    description: "Warm, smoky fragrance inspired by the scent of a fireplace",
    logo: "assets/images/frag/brand/MaisonMargiela.jpg",
  ),
  Brand(
    name: "Creed",
    description: "A legendary fragrance known for its fruity and smoky notes",
    logo: "assets/images/frag/parfume_image/CreedAventus.jpg",
  ),
  Brand(
    name: "Calvin Klein",
    description:
        "Calvin Klein — легендарный американский бренд, известный своей минималистичной эстетикой и культовыми ароматами.",
    logo: "assets/images/frag/brand/CalvinKlein.jpg",
  ),
];
