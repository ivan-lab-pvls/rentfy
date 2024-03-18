import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transport_app/model/news_item.dart';
import 'package:transport_app/pages/description_news_page.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsItem> newsList = [
    NewsItem(
        title: '15 Fastest EVs to Lap the Nurburgring',
        text:
            'Porsche\'s new Taycan Turbo GT just broke a record to become the fastest production four-door to lap the famed Nurburgring Nordschleife—and the second-fastest production EV. Porsche accomplished that feat in 7:07.55, making it quicker around the Green Hell than a vast majority of cars on sale today, gas or electric. But it\'s not the reigning EV champion. One production car and a few electric race cars and concepts have done it faster. Since 2010, automakers have been taking their performance EVs to the track in hopes of capturing a lap record. And as more performance EVs enter the market, expect more record-breaking laps in the months and years to come. In the meantime, we\'ve put together a list of the 15 fastest electric vehicles to ever do it. These cars all have a spot in the Nurburgring record books for their fast laps, and some of them won\'t see their records broken anytime soon.',
        image:
            'https://cdn.motor1.com/images/mgl/9mQNZm/s1/hyundai-ioniq-5-n-nurburgring.webp',
        date: '03/14/2024'),
    NewsItem(
        title: 'BMW Sends Off the Manual in Japan With Limited Edition M3',
        text:
            'The manual transmission is a dying breed. While manuals hold a bit more of a market share than they did in years past, it\'s still only a matter of time before manuals are gone for good. The latest evidence comes from Japan, where BMW is sending off its manual transmission with a special edition M3. Built to commemorate the 35th anniversary of BMW\'s first DTM win, the M3 MT Final Edition will be limited to just 150 units and sold only to customers in Japan. MT stands for Manual Transmission, obviously, with every unit equipped with three pedals as standard. Like in other M3s, it\'s mated to a 3.0-liter twin-turbo S58 straight-six.BMW will build 50 units each in Alpine White, Black Sapphire, and M Brooklyn Gray. All 150 cars will get gold wheels and red seat accents, inspired by the original E30-generation M3 DTM race car piloted by Roberto Ravaglia.',
        image:
            'https://cdn.motor1.com/images/mgl/xqnbZy/s1/2024-bmw-m3-mt-final-edition-for-japan-1.webp',
        date: '03/14/2024'),
    NewsItem(
        title: 'Majority of Drivers Are Afraid of Autonomous Cars, Study Says',
        text:
            'The promise of fully self-driving cars remains elusive. That might be a good thing, at least going by a new study from AAA that found the majority of people are actually afraid of autonomous vehicles. Even more surprising: That number has increased in recent years while public trust has fallen. According to AAA, 66 percent of respondents said they feared self-driving vehicles. That’s up from 55 percent in 2022, but down from 68 percent last year. The share of those who trust AVs held steady from 2023 to 2024 at 9 percent, while 25 percent were unsure of them. Both numbers are down from 15 and 30 percent, respectively, in 2022. While buyers might be weary of robot cars, they aren’t opposed to some technological assistance behind the wheel. Respondents said they were interested in some technology, with more than half open to automatic braking, reverse automatic braking, and lane keep assist. Only 42 percent were interested in active driving assist, and 49 percent were for adaptive cruise control.',
        image: 'https://cdn.motor1.com/images/mgl/Qe3X1O/s1/cruise-av.webp',
        date: '03/14/2024'),
    NewsItem(
        title:
            'Porsche\'s Active Suspension Is Mind-Blowing. Here\'s How It Works ',
        text:
            'Lars Kern is having a great time. I am too. I’m sitting right seat with Porsche’s ace development driver as he romps the Panamera Turbo E-Hybrid over every single curb and rumble strip on Seville’s Circuito Monteblanco. Normally, this sort of behavior is wantonly abusive. But thanks to Porsche’s new active suspension, the car makes the harshest abuses feel like hiccups. It’s a massive engineering achievement in service of pure silliness.   Porsche Active Ride is not the first or only active suspension system out there, but it is arguably the most powerful, and its implementation is fascinating. And note that this is not an adaptive system, which can make damper adjustments electronically, but is only ever reactive; an active suspension system puts force into the body to counteract its motion. Each corner of the car has a motor-pump unit that controls the amount of hydraulic pressure in the damper with an electric motor. The front and rear motor-pump units are mounted together and share an aluminum housing that bolts up where the traditional anti-roll bar would go, but each wheel moves independently of one another.  For example, the right front wheel hitting a bump doesn’t directly affect the left front. The motor-pump units are powered by the 400-volt battery used in Panamera E-Hybrid models and can put 2,248 pounds of force into each corner of the car. (Porsche Active Ride is also coming to the facelifted Taycan, and the system uses a DC-DC converter to step down from 800 to 400 volts.) ',
        image:
            'https://cdn.motor1.com/images/mgl/BXe2qw/s1/porsche-active-ride.webp',
        date: '03/14/2024'),
    NewsItem(
        title: 'The New Kia K4 Has A Strange Rear Pillar',
        text:
            'The Forte is dead. Long live the K4. Kia will replace the compact sedan with a new car scheduled to debut on March 27 at the New York Auto Show. Kia will show the final design a week from today, but in the meantime these teaser images will have to make do. The 2025 Kia K4 already looks a lot different than the outgoing model. It shares some styling cues with the K3 introduced in August 2023, but that car isn\'t coming to the United States. We are getting the new K4, complete with droopy lights reminiscent of a Cadillac. We\'ve tweaked the exposure and brightness of the official images to unlock more design details of Kia\'s Corolla fighter. That weird rear pillar we saw in spy shots and renderings is now confirmed. Eagle-eyed readers will notice the rear door handles are no longer where they\'re supposed to be, having been "hidden" at the base of the pillar. What comes after that is strange, with an oddly shaped quarter glass giving the illusion that it\'s partially hiding behind the quarter panel. It\'s certainly an unconventional design but not a surprise given Kia\'s recent string of daring designs.',
        image:
            'https://cdn.motor1.com/images/mgl/g4MJo9/s1/2025-kia-k4-teaser.webp',
        date: '03/14/2024'),
    NewsItem(
        title: 'Dacia Will Sell You A New Car Without A Center Screen',
        text:
            'The overreliance on screens has become a safety concern. We tend to take our eyes off the road to navigate through submenus to access an often-used feature. It\'s a real problem that Euro NCAP has recently highlighted. From 2026, Europe\'s independent safety organization will penalize automakers by lowering the safety rating of a car that doesn\'t have physical controls for certain functions. This decision got us thinking – are there still cars without center screens? By that, we mean no display whatsoever. There are a handful of cars with non-touch screens surrounded by buttons, but we want to focus on car interiors that do completely away with a center screen. The answer would have to be yes. For example, Dacia will sell you a Sandero hatchback, Logan sedan, Jogger wagon, or a Duster SUV without a central display, provided you stick to the cheapest version. While the Sandero, Logan, and Jogger have been around for a few years, the latest Duster is a brand-new car that\'s just going on sale. Configurators are up and running in more and more European countries, revealing a gloriously spartan interior for the entry-level version. Renault\'s low-cost division isn\'t the only company doing it since Fiat has a no-screen setup for the cheapest Panda. In its third generation since 2011, the adorable city car recently had its life cycle extended to 2026. Another Stellantis brand, Fiat, recently launched the ë-C3, and it too can be had without a screen screen. ',
        image: 'https://cdn.motor1.com/images/mgl/jlE2J1/s1/dacia-duster.webp',
        date: '03/14/2024'),
    NewsItem(
        title:
            'The Hyundai ST1 Is An Electric Work Van With Futuristic Styling',
        text:
            'And now for something completely different from Hyundai – a fully electric work van that looks like it has traveled back from the future. The ST1 sounds like the name of a trim level for a Ford Fiesta ST (RIP) or Focus ST sold in Europe. However, this alphanumeric designation denotes a purpose-built lineup of workhorses bundled as "Service Type 1" vehicles. In typical Hyundai fashion, this initial reveal is only about the exterior design, with no details about technical specifications. We do know the ST1 is exclusively electric and has been developed to cater to small businesses in South Korea. It will be offered as a regular cargo van, a refrigerated van, and as a basic chassis cab for owners to retrofit the type of equipment they need. Hyundai says it worked with local delivery companies to find out what they need from a work van. Riding on steelies and fitted with unpainted bumpers, the workhorse has a futuristic front-end design derived from the Staria minivan or the Kona small crossover. The main headlights are mounted unusually low while the full-width horizontal strip above is presumably for the daytime running lights.',
        image: 'https://cdn.motor1.com/images/mgl/0eKVGz/s1/hyundai-st1.webp',
        date: '03/14/2024'),
    NewsItem(
        title:
            'The 2024 Porsche Panamera\'s Active Suspension Is A Game-Changer',
        text:
            'Life is pretty good in a Porsche Panamera. It’s an unabashed luxury sedan, but also a driver’s car—more of a modern grand tourer than anything else. It exists somewhere on the spectrum between the BMW 8 Series and the Mercedes-Benz S-Class, and you won’t find anything else quite like its mix of talents. The Panamera is new for 2024, but not all-new, as it were. This is a heavy revision of the previous Panamera with ample tweaks to bridge the divide between sport and luxury. The highlight of these efforts is Porsche Active Ride, an active-suspension system that is truly mind-blowing, but we’ll get back to that a little later. On the mountain roads outside Seville, Spain, we drove the base Panamera, then tested the new Turbo E-Hybrid—with its active suspension—at the Circuito Monteblanco. Porsche builds seemingly endless variants of its cars, luring buyers up the ladder with models incrementally more powerful and luxurious than the slightly less-expensive model below. But in Porsche’s world, base models should not be overlooked. They offer the essence of the top-spec models for less money. I’ll stop short of saying they’re a great value, because the US-spec equivalent to this base Panamera costs \$133,310 as optioned, and for that you just get a twin-turbo 2.9-liter V-6 with 348 horsepower and 361 pound-feet of torque.',
        image:
            'https://cdn.motor1.com/images/mgl/0eKVXp/s4/2024-porsche-panamera.webp',
        date: '03/14/2024'),
    NewsItem(
        title: 'The Nissan GT-R Is Back For 2025 With A Blue Interior',
        text:
            'Nissan launched the 2025 GT-R in Japan and the aging supercar will go on sale in June. The only mechanical change is for the Premium Edition T-spec and Track Edition models, which inherit hardware from the Nismo Special Edition; weight-balanced piston rings, connecting rods, and crankshafts. You even get an aluminum plaque denoting who built the car along with a gold-colored plate with the chassis number. Go for the Premium Edition and you can now order it with a Blue Heaven interior. This trim level for the venerable supercar costs the equivalent of \$105,400, but there\'s also a cheaper Pure Edition at \$97,700. The most expensive of the bunch is the Nismo Special Edition at \$207,000. Nissan is already accepting orders for the 2025 GT-R in Japan. The company points out production will be limited, so much so that it might have to refuse orders if demand exceeds supply. This footnote in the press release fuels rumors about the R35 going away after this model year. Japanese publication Mag-X reported last week about 2025 being the final model year, mentioning production would be limited.',
        image:
            'https://cdn.motor1.com/images/mgl/ojmbg0/s4/2025-nissan-gt-r-jdm.webp',
        date: '03/14/2024'),
    NewsItem(
        title: 'The New Audi A3 Is Amess With In-Car Subscriptions',
        text:
            'The Audi A3 is a survivor. The compact luxury car has been around in one form or another since 1996, and an updated version is coming to the US for the 2025 model year. But it\'s loaded with annoying in-car subscriptions. At first glance, this new A3 looks a lot like the car it replaces. The hexagonal Singleframe grille—in line with Audi\'s latest designs—is its biggest change, joined by bigger air intakes at the base of the bumper, an Audi logo high on the nose, and refreshed LED and matrix LED headlights with four customizable daytime lighting signatures. The rear bumper design, inspired by the RS3, has a new LED taillight treatment, a black accent piece, and a mesh insert at the base. Inside is where things get interesting. The same 10.1-inch touchscreen and 12.3-inch digital instrument cluster from last year carry over, but now you\'ll have to pay an in-car subscription fee for basic features like high-beam assist, dual-zone climate control, adaptive cruise control, and smartphone integration. Only by upgrading to the MMI navigation system do you get access to the app store. From there, Audi forces you into add-ons like adaptive cruise control or Apple CarPlay and Android Auto for a one-month, six-month, one-year, or three-year subscription. Or you can just purchase any of those features permanently—although Audi doesn\'t say for how much.',
        image:
            'https://cdn.motor1.com/images/mgl/qk6Wlq/s1/audi-a3-allstreet.jpg',
        date: '03/14/2024'),
    NewsItem(
        title: 'Ford Trademarks RS200, Hopefully For A Sports Car',
        text:
            'The mysterious world of automaker patents and trademarks is buzzing today with two letters and a number: RS and 200. We learned recently Ford has applied for the RS200 trademark in Europe, reigniting the flames of hope that a redux of the original rally-bred homologation special might soon reach production. Though we wouldn\'t count on it. Here\'s why. Automakers frequently trademark all kinds of names, and oftentimes we never see anything come of it. Yes, a plethora of new names can preview a new model or trim level being considered. Reupping old names can suggest a revival is imminent, but old names also have brand equity. Depending on the name, it could be worth renewing a trademark simply to protect that equity. And it should be painfully obvious that RS200 has gobs of equity for Ford. The original Ford RS200 was a product of Group B, an era in the mid-1980s when the World Rally Championship went crazy with hilariously overpowered race cars disguised as street-legal econoboxes. To partake in the insanity, automakers needed a certain number of actual street cars to meet homologation requirements for the series.',
        image: 'https://cdn.motor1.com/images/mgl/Qe3X48/s1/ford-rs200.webp',
        date: '03/13/2024'),
    NewsItem(
        title: 'The ID.7 GTX Tourer Is Volkswagen’s Most Powerful Wagon Ever',
        text:
            'Move over, Golf R wagon, for there\'s a new king of long-roof performance in Volkswagen\'s lineup. The ID.7 GTX Tourer becomes Wolfsburg\'s most potent production wagon, eclipsing the 315-horsepower Golf R Variant. Too bad it isn\'t coming to the US. VW’s first electric performance wagon delivers a combined output of 335 hp from a pair of electric motors, enabling all-wheel drive. Most of the heavy lifting is done by the rear motor as it produces 282 hp whereas the front motor is good for another 107 hp. The German brand says the front e-motor kicks in only when necessary and comes alive in fractions of a second. Power transfer is achieved through electronic differential locks and a custom AWD controller. The dual-motor setup helps the ID.7 GTX Tourer tow up to 3,086 pounds, whereas the rear-wheel-drive, single-motor variant introduced last month can only haul 2,204 lbs. While the lesser model also comes with a 77.0-kilowatt-hour battery in its basic form, the GTX gets the upgraded 86.0-kilowatt-hour pack as standard. It can be charged at up to 200 kilowatts using DC, enabling a 10 to 80 percent charge in under half an hour. The maximum range isn\'t mentioned but we reckon it\'s less efficient than the rear-wheel-drive model with the bigger battery, which can cover 426 miles in the WLTP cycle. Oddly enough, VW isn\'t providing any details about performance either. We estimate the 0 to 62 mph run is achieved in either the low six-second or high five-second range considering the regular ID.7 hatchback with rear-wheel drive and only 282 hp takes six and a half seconds.',
        image:
            'https://cdn.motor1.com/images/mgl/YA3YGW/s1/volkswagen-id.7-gtx-tourer-2024.jpg',
        date: '03/13/2024'),
    NewsItem(
        title: 'The 322-HP ID.3 GTX Is Volkswagen\'s First Electric Hot Hatch',
        text:
            'Volkswagen is finally dipping its toes in the electric hot hatch segment with the ID.3 GTX. Essentially a sister model to the Cupra Born VZ, the sporty EV comes in two flavors. There\'s a base GTX and a spicy GTX Performance with the single most powerful electric motor ever developed by VW. Stick to the regular ID.3 GTX and you get an electric motor on the rear axle with 282 horsepower and 402 pound-feet of torque. Upgrade to the Performance model and VW will up the power ante to 322 hp while torque remains the same. Predictably, these higher output figures perfectly match those of the Cupra Born VZ. The rear-wheel-drive hot hatch takes six seconds to hit 62 miles per hour from a standstill for the regular GTX, or 5.6 seconds if you upgrade to the GTX Performance. Top speed is electronically capped at 111 mph and 124 mph, respectively. VW says the more potent of the two models is an electric companion to the front-wheel-drive Golf GTI Clubsport.',
        image:
            'https://cdn.motor1.com/images/mgl/1ZKk4q/s1/volkswagen-id.3-gtx-2024.jpg',
        date: '03/13/2024'),
    NewsItem(
        title:
            'Watch the Porsche Taycan Turbo GT\'s Record-Breaking Nürburgring Run',
        text:
            'The Porsche Taycan Turbo GT is the fastest four-door production vehicle to lap the Nürburgring\'s Nordschleife loop. The 7 minutes, 7.55 seconds lap time, set last year, nearly bested the Rimac Nevera as the fastest production EV at the famous track. Going by the numbers, the most powerful production Porsche ever is extremely quick. But numbers can only express so much. In-car video, however, gives us a taste of what those performance numbers really look like. The video, published by Porsche on Wednesday, shows how the Taycan Turbo GT achieving that record-setting time. In the hands of seasoned driver Lars Kern, the new Porsche clocks 175 mph early in the lap through Kottenborn and Schwedenkreuz, one of the fastest sections of the long track. But the corners leading up to the sprint show the Taycan is planted and —dare we say — nimble despite weighing almost 5,000 pounds. The next moment of interest comes shortly thereafter, as Kern carves the Turbo GT through another fast section of track. Fuchsrohre needs bravery, after all. The car reaches 160 mph through this tricky descent and ascent approaching the aforementioned corner. Kern makes it look easy, going by the video.',
        image:
            'https://cdn.motor1.com/images/mgl/xqno8p/s4/porsche-taycan-turbo-gt-nurburgring-ring-lap-no-hands.webp',
        date: '03/13/2024'),
    NewsItem(
        title: 'How Much Does A Rivian Cost?',
        text:
            'Electric vehicle pricing can be tricky, especially Rivian, which has five different models with up to four battery pack options and three motor configurations. But instead of digging deep into Rivian\'s complicated configurator, we\'ve broken down details like price, performance, and range onto a single list—so you\'ll know exactly which Rivian is right for you. It should be noted that all Rivians under \$80,000 qualify for a \$3,750 federal tax credit in the US if you\'re buying outright. Customers who lease their Rivians will receive the full \$7,5000 tax credit (as of publication). With that in mind, here\'s how much you might spend on a new Rivian model.',
        image: 'https://cdn.motor1.com/images/mgl/XBY27V/s4/rivian-r1s.webp',
        date: '03/13/2024'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1F23),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 65, 16, 18),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.chevron_left,
                    color: Color(0xFF7089E1),
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Color(0xFF7089E1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'News',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [getNews()],
              ),
            )),
          ),
        ],
      ),
    );
  }

  Widget getNews() {
    List<Widget> list = [];
    for (var news in newsList) {
      list.add(Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => DescriptionNewsPage(
                        news: news,
                      )),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: const Color(0xFF2E313C),
                borderRadius: BorderRadius.circular(8)),
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                              news.image!,
                            ))),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                news.title!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                news.text!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          news.date!,
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ));
    }
    return Column(
      children: list,
    );
  }
}
