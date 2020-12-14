class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'sports' },
    { id: 3, name: 'music' },
    { id: 4, name: 'animation' },
    { id: 5, name: 'beaty' },
    { id: 6, name: 'comedy' },
    { id: 7, name: 'healing' },
  ]
end
