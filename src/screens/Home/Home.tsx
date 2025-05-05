import React from "react";
import { Button } from "../../components/ui/button";
import { Card, CardContent } from "../../components/ui/card";

// Import images
import ico from "../../assets/img/ico.png";
import heroImage from "../../assets/img/hero-image.png";
import featuredImage from "../../assets/img/featured-image.png";
import featuredImage1 from "../../assets/img/featured-image-1.png";
import featuredImage2 from "../../assets/img/featured-image-2.png";
import icon from "../../assets/img/icon.svg";
import youtube from "../../assets/img/youtube.svg";
import twitter from "../../assets/img/twitter.svg";
import browser from "../../assets/img/browser.svg";
import pinterest from "../../assets/img/pinterest.svg";

export const Home = (): JSX.Element => {
  // Navigation menu items
  const navItems = [
    { title: "Home", active: true },
    { title: "Rezepte", active: false },
    { title: "Über uns", active: false },
  ];

  // Recipe card data
  const recipeCards = [
    {
      title: "Waffeln",
      description:
        "Ein tolles Rezept für ein morgendliches Essen mit Freunden.",
      image: featuredImage,
    },
    {
      title: "Pancakes",
      description:
        "Ein tolles Rezept für ein morgendliches Essen mit Freunden.",
      image: featuredImage1,
    },
    {
      title: "Heisse Schokolade",
      description:
        "Ein tolles Rezept für ein morgendliches Essen mit Freunden.",
      image: featuredImage2,
    },
  ];

  // Social media icons
  const socialIcons = [
    { name: "Youtube", src: youtube },
    { name: "Twitter", src: twitter },
    { name: "Browser", src: browser },
    { name: "Pinterest", src: pinterest },
  ];

  return (
    <div className="bg-white flex flex-row justify-center w-full">
      <div className="bg-white w-full max-w-[1440px] relative">
        <div className="w-full">
          <header className="w-full">
            <div className="w-full h-[30px] bg-yellow-300" />
            <div className="w-full h-[113px] bg-white-100">
              <div className="flex w-full max-w-[1286px] h-[31px] items-center justify-between mx-auto py-[41px] px-[77px]">
                <div className="flex items-center">
                  <img className="w-7 h-[26px]" alt="Ico" src={ico} />
                  <div className="ml-3 font-medium text-neutral-800 text-[26px]">
                    Die Rezeptwelt
                  </div>
                </div>

                <div className="flex items-center gap-[46px]">
                  {navItems.map((item) => (
                    <div
                      key={item.title}
                      className="font-bold text-neutral-800 text-[26px] cursor-pointer"
                    >
                      {item.title}
                    </div>
                  ))}
                </div>

                <div className="font-bold text-neutral-800 text-[26px] cursor-pointer">
                  Login
                </div>
              </div>
            </div>
          </header>

          <section className="w-full h-[362px] relative">
            <div
              className="w-full h-full bg-cover bg-center"
              style={{ backgroundImage: `url(${heroImage})` }}
            >
              <div className="absolute w-full h-full top-0 left-0 bg-neutral-950 opacity-50" />
              <div className="relative h-full flex items-center justify-center">
                <div className="w-[898px] text-center text-white-100 font-all-banner text-[40px] font-bold leading-normal px-4">
                  Lassen Sie sich inspirieren, kochen Sie mit Leidenschaft und
                  erleben Sie unvergessliche Momente bei Tisch.
                </div>
              </div>
            </div>
          </section>

          <section className="flex flex-col items-center mt-[89px] px-[77px]">
            <h2 className="font-bold text-neutral-800 text-[38.9px] mb-[58px]">
              Die beliebtesten Rezepte
            </h2>

            <div className="flex justify-center gap-[38px] w-full max-w-[1285px]">
              {recipeCards.map((card, index) => (
                <Card
                  key={index}
                  className="w-[403px] h-[473.68px] rounded-none shadow-none bg-transparent"
                >
                  <div className="h-[212px] overflow-hidden">
                    <img
                      className="w-full h-full object-cover"
                      alt={`${card.title} image`}
                      src={card.image}
                    />
                  </div>
                  <CardContent className="p-0">
                    <div className="h-[262px] bg-white-200 rounded-[0px_0px_33px_33px] p-[29px_38px]">
                      <h3 className="font-bold text-neutral-800 text-[32px]">
                        {card.title}
                      </h3>
                      <p className="mt-[18px] font-normal text-neutral-800 text-[20.7px] h-[51px] w-[327px]">
                        {card.description}
                      </p>
                      <Button className="mt-[40px] bg-yellow-300 text-neutral-800 rounded-[32px] px-[33px] py-[9px] font-bold text-[20.7px] hover:bg-yellow-100">
                        Zum Rezept
                      </Button>
                    </div>
                  </CardContent>
                </Card>
              ))}
            </div>
          </section>

          <footer className="w-full h-[273px] mt-[89px] bg-yellow-300">
            <div className="flex justify-between max-w-[1212px] mx-auto pt-[85px] px-[114px]">
              <div className="flex items-center">
                <img className="w-[50px] h-[46px]" alt="Icon" src={icon} />
                <div className="ml-[27px] font-semibold text-neutral-800 text-[46.1px]">
                  Die Rezeptwelt
                </div>
              </div>

              <div className="w-[202px]">
                <div className="font-semibold text-neutral-950 text-[26px]">
                  Social Media
                </div>
                <div className="flex gap-2 mt-[26px]">
                  {socialIcons.map((icon) => (
                    <div
                      key={icon.name}
                      className="flex items-center justify-center p-1.5 bg-yellow-100 rounded-[7px] cursor-pointer"
                    >
                      <img className="w-8 h-8" alt={icon.name} src={icon.src} />
                    </div>
                  ))}
                </div>
              </div>
            </div>
          </footer>
        </div>
      </div>
    </div>
  );
};