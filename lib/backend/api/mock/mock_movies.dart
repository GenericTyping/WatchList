import 'package:watchlist/backend/models/models.dart';

const mockMovieStarWars = Movie(
  adult: false,
  backdropPath: '/4iJfYYoQzZcONB9hNzg0J0wWyPH.jpg',
  belongsToCollection: MovieCollection(
    id: 10,
    name: 'Star Wars Collection',
    posterPath: '/mEpQbsUSekbQRdffXMeQWjeHb34.jpg',
    backdropPath: '/d8duYyyC9J5T825Hg7grmaabfxQ.jpg',
  ),
  budget: 11000000,
  genres: [
    Genre(
      id: 12,
      name: 'Adventure',
    ),
    Genre(
      id: 28,
      name: 'Action',
    ),
    Genre(
      id: 878,
      name: 'Science Fiction',
    )
  ],
  homepage: 'http://www.starwars.com/films/star-wars-episode-iv-a-new-hope',
  id: 11,
  imdbId: 'tt0076759',
  originalLanguage: 'en',
  originalTitle: 'Star Wars',
  overview: 'Princess Leia is captured and held '
      'hostage by the evil Imperial forces '
      'in their effort to take over the galactic Empire. '
      'Venturesome Luke Skywalker and dashing captain '
      'Han Solo team together with the loveable robot duo '
      'R2-D2 and C-3PO to rescue the beautiful princess and '
      'restore peace and justice in the Empire.',
  popularity: 43.804,
  posterPath: '/btTdmkgIvOi0FFip1sPuZI2oQG6.jpg',
  productionCompanies: [
    ProductionCompany(id: 1, logoPath: '/o86DbpburjxrqAzEDhXZcyE8pDb.png', name: 'Lucasfilm', originCountry: 'US'),
    ProductionCompany(
        id: 25, logoPath: '/qZCc1lty5FzX30aOCVRBLzaVmcp.png', name: '20th Century Fox', originCountry: 'US')
  ],
  productionCountries: [
    ProductionCountry(
      iso31661: 'US',
      name: 'United States of America',
    )
  ],
  releaseDate: '1977-05-25',
  revenue: 775398007,
  runtime: 121,
  spokenLanguages: [
    SpokenLanguage(
      iso6391: 'en',
      name: 'English',
    )
  ],
  status: 'Released',
  tagline: 'A long time ago in a galaxy far, far away...',
  title: 'Star Wars',
  video: false,
  voteAverage: 8.2,
  voteCount: 11858,
);
