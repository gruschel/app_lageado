
class JSON_Test_Internal{

  static Map<String, dynamic> cars =
  {
    "IHW0001": {
      "ownerid": "1",
      "model": "CARRO GENÉRICO",
      "year": "1800",
      "renavam": "61426451408",
    },
    "IHW0002": {
      "ownerid": "1",
      "model": "CARRO GENÉRICO",
      "year": "1800",
      "renavam": "89699659428",
    },
    "IHW0003": {
      "ownerid": "30",
      "model": "CARRO GENÉRICO",
      "year": "1800",
      "renavam": "33059496130",
    },
    "IHW0004": {
      "ownerid": "2",
      "model": "CARRO GENÉRICO",
      "year": "1800",
      "renavam": "09599654531",
    },
    "IHW0005": {
      "ownerid": "5",
      "model": "CARRO GENÉRICO",
      "year": "1800",
      "renavam": "76552468070",
    },
    "IHW0006": {
      "ownerid": "25",
      "model": "CARRO GENÉRICO",
      "year": "1800",
      "renavam": "43494160261",
    },
    "IHW0007": {
      "ownerid": "25",
      "model": "CARRO GENÉRICO",
      "year": "1800",
      "renavam": "57780419190",
    },
    "IHW0008": {
    "ownerid": "2",
    "model": "CARRO GENÉRICO",
    "year": "1800",
    "renavam": "93615531784",
  }
  };

  static Map<int, dynamic> owners =
  {
    1 : {
      "name": "Carlos Silva da Costa",
      "phone": "888888888",
      "email": "teste@teste.com.br",
      "adress": "Rua qualquer",
      "district": "Bairro qualquer",
    },
    30 : {
      "name": "Trevor Maverick",
      "phone": "777777777",
      "email": "ttt@ttt.com.br",
      "adress": "Rua qualquer2",
      "district": "Bairro qualquer2",
    },
    25 : {
      "name": "Santana Santos",
      "phone": "66666666",
      "email": "ss@bb.com",
      "adress": "Calle 13",
      "district": "Bairro Top",
    },
    2 : {
      "name": "Ronaldinho Gaúcho",
      "phone": "555555555",
      "email": "mengao@mengao.com.br",
      "adress": "Favela",
      "district": "Bairro do trafico",
    },
    5 : {
      "name": "Jair Messias Bolsonaro",
      "phone": "111111111",
      "email": "brasil@gov.com.br",
      "adress": "Todo lugar",
      "district": "Todos",
    },
  };

  static Map<int, dynamic> services =
  {
    100 : {
      "license": "IHW0001",
      "status": 0,
      "startDate": "01/10/2002",
      "endDate": "01/10/2050",
      "serviceType": "BALANCEAMENTO",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eleifend porta mauris, id pellentesque turpis semper semper. Vivamus scelerisque at dui malesuada pharetra. Mauris interdum, ligula vel placerat imperdiet, velit est eleifend sem, sit amet rutrum elit eros at massa. Praesent at sagittis felis. Curabitur tincidunt accumsan turpis, ut laoreet orci porta et. Donec ac nisl eu lectus rhoncus lacinia vel vitae nulla. Etiam dapibus viverra erat, eget pellentesque velit pharetra eget. In eget finibus magna, nec tincidunt nunc. Pellentesque augue magna, suscipit blandit venenatis quis, fringilla eget mauris. Pellentesque eu elit tincidunt, dignissim nisi vel, egestas mi.Nunc ac nulla at felis dignissim tempus sit amet efficitur leo. Fusce commodo in ipsum id dignissim. Suspendisse ultrices volutpat orci aliquam ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse rutrum feugiat finibus. Donec tempor augue nunc, sed tincidunt nisl egestas sed. Phasellus non orci hendrerit, condimentum quam sit amet, venenatis sem. Nulla nec iaculis lorem. Cras accumsan purus est, vel viverra augue vestibulum in. Curabitur in ex vestibulum, semper ante sit amet, dignissim sapien. Sed hendrerit mi eget tincidunt vestibulum. Nulla mollis a ante in congue.",
    },
    58 : {
      "license": "IHW0005",
      "status": 3,
      "startDate": "01/10/2102",
      "endDate": "01/10/2050999",
      "serviceType": "BALANCEAMENTO",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eleifend porta mauris, id pellentesque turpis semper semper. Vivamus scelerisque at dui malesuada pharetra. Mauris interdum, ligula vel placerat imperdiet, velit est eleifend sem, sit amet rutrum elit eros at massa. Praesent at sagittis felis. Curabitur tincidunt accumsan turpis, ut laoreet orci porta et. Donec ac nisl eu lectus rhoncus lacinia vel vitae nulla. Etiam dapibus viverra erat, eget pellentesque velit pharetra eget. In eget finibus magna, nec tincidunt nunc. Pellentesque augue magna, suscipit blandit venenatis quis, fringilla eget mauris. Pellentesque eu elit tincidunt, dignissim nisi vel, egestas mi.Nunc ac nulla at felis dignissim tempus sit amet efficitur leo. Fusce commodo in ipsum id dignissim. Suspendisse ultrices volutpat orci aliquam ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse rutrum feugiat finibus. Donec tempor augue nunc, sed tincidunt nisl egestas sed. Phasellus non orci hendrerit, condimentum quam sit amet, venenatis sem. Nulla nec iaculis lorem. Cras accumsan purus est, vel viverra augue vestibulum in. Curabitur in ex vestibulum, semper ante sit amet, dignissim sapien. Sed hendrerit mi eget tincidunt vestibulum. Nulla mollis a ante in congue.",
    },
    59 : {
      "license": "IHW0002",
      "status": 1,
      "startDate": "01/10/2002",
      "endDate": "01/10/2050",
      "serviceType": "REPARO",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eleifend porta mauris, id pellentesque turpis semper semper. Vivamus scelerisque at dui malesuada pharetra. Mauris interdum, ligula vel placerat imperdiet, velit est eleifend sem, sit amet rutrum elit eros at massa. Praesent at sagittis felis. Curabitur tincidunt accumsan turpis, ut laoreet orci porta et. Donec ac nisl eu lectus rhoncus lacinia vel vitae nulla. Etiam dapibus viverra erat, eget pellentesque velit pharetra eget. In eget finibus magna, nec tincidunt nunc. Pellentesque augue magna, suscipit blandit venenatis quis, fringilla eget mauris. Pellentesque eu elit tincidunt, dignissim nisi vel, egestas mi.Nunc ac nulla at felis dignissim tempus sit amet efficitur leo. Fusce commodo in ipsum id dignissim. Suspendisse ultrices volutpat orci aliquam ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse rutrum feugiat finibus. Donec tempor augue nunc, sed tincidunt nisl egestas sed. Phasellus non orci hendrerit, condimentum quam sit amet, venenatis sem. Nulla nec iaculis lorem. Cras accumsan purus est, vel viverra augue vestibulum in. Curabitur in ex vestibulum, semper ante sit amet, dignissim sapien. Sed hendrerit mi eget tincidunt vestibulum. Nulla mollis a ante in congue.",
    },
    3 : {
      "license": "IHW0007",
      "status": 2,
      "startDate": "01/10/2002",
      "endDate": "01/10/2050",
      "serviceType": "BALANCEAMENTO",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eleifend porta mauris, id pellentesque turpis semper semper. Vivamus scelerisque at dui malesuada pharetra. Mauris interdum, ligula vel placerat imperdiet, velit est eleifend sem, sit amet rutrum elit eros at massa. Praesent at sagittis felis. Curabitur tincidunt accumsan turpis, ut laoreet orci porta et. Donec ac nisl eu lectus rhoncus lacinia vel vitae nulla. Etiam dapibus viverra erat, eget pellentesque velit pharetra eget. In eget finibus magna, nec tincidunt nunc. Pellentesque augue magna, suscipit blandit venenatis quis, fringilla eget mauris. Pellentesque eu elit tincidunt, dignissim nisi vel, egestas mi.Nunc ac nulla at felis dignissim tempus sit amet efficitur leo. Fusce commodo in ipsum id dignissim. Suspendisse ultrices volutpat orci aliquam ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse rutrum feugiat finibus. Donec tempor augue nunc, sed tincidunt nisl egestas sed. Phasellus non orci hendrerit, condimentum quam sit amet, venenatis sem. Nulla nec iaculis lorem. Cras accumsan purus est, vel viverra augue vestibulum in. Curabitur in ex vestibulum, semper ante sit amet, dignissim sapien. Sed hendrerit mi eget tincidunt vestibulum. Nulla mollis a ante in congue.",
    },
    7 : {
      "license": "IHW0008",
      "status": 4,
      "startDate": "01/10/2002",
      "endDate": "01/10/2050",
      "serviceType": "BALANCEAMENTO",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eleifend porta mauris, id pellentesque turpis semper semper. Vivamus scelerisque at dui malesuada pharetra. Mauris interdum, ligula vel placerat imperdiet, velit est eleifend sem, sit amet rutrum elit eros at massa. Praesent at sagittis felis. Curabitur tincidunt accumsan turpis, ut laoreet orci porta et. Donec ac nisl eu lectus rhoncus lacinia vel vitae nulla. Etiam dapibus viverra erat, eget pellentesque velit pharetra eget. In eget finibus magna, nec tincidunt nunc. Pellentesque augue magna, suscipit blandit venenatis quis, fringilla eget mauris. Pellentesque eu elit tincidunt, dignissim nisi vel, egestas mi.Nunc ac nulla at felis dignissim tempus sit amet efficitur leo. Fusce commodo in ipsum id dignissim. Suspendisse ultrices volutpat orci aliquam ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse rutrum feugiat finibus. Donec tempor augue nunc, sed tincidunt nisl egestas sed. Phasellus non orci hendrerit, condimentum quam sit amet, venenatis sem. Nulla nec iaculis lorem. Cras accumsan purus est, vel viverra augue vestibulum in. Curabitur in ex vestibulum, semper ante sit amet, dignissim sapien. Sed hendrerit mi eget tincidunt vestibulum. Nulla mollis a ante in congue.",
    },
    17 : {
      "license": "IHW0008",
      "status": 2,
      "startDate": "01/10/2002",
      "endDate": "01/10/2050",
      "serviceType": "BALANCEAMENTO",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eleifend porta mauris, id pellentesque turpis semper semper. Vivamus scelerisque at dui malesuada pharetra. Mauris interdum, ligula vel placerat imperdiet, velit est eleifend sem, sit amet rutrum elit eros at massa. Praesent at sagittis felis. Curabitur tincidunt accumsan turpis, ut laoreet orci porta et. Donec ac nisl eu lectus rhoncus lacinia vel vitae nulla. Etiam dapibus viverra erat, eget pellentesque velit pharetra eget. In eget finibus magna, nec tincidunt nunc. Pellentesque augue magna, suscipit blandit venenatis quis, fringilla eget mauris. Pellentesque eu elit tincidunt, dignissim nisi vel, egestas mi.Nunc ac nulla at felis dignissim tempus sit amet efficitur leo. Fusce commodo in ipsum id dignissim. Suspendisse ultrices volutpat orci aliquam ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse rutrum feugiat finibus. Donec tempor augue nunc, sed tincidunt nisl egestas sed. Phasellus non orci hendrerit, condimentum quam sit amet, venenatis sem. Nulla nec iaculis lorem. Cras accumsan purus est, vel viverra augue vestibulum in. Curabitur in ex vestibulum, semper ante sit amet, dignissim sapien. Sed hendrerit mi eget tincidunt vestibulum. Nulla mollis a ante in congue.",
    },
    18 : {
      "license": "IHW0008",
      "status": 0,
      "startDate": "01/10/2002",
      "endDate": "01/10/2050",
      "serviceType": "BALANCEAMENTO",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eleifend porta mauris, id pellentesque turpis semper semper. Vivamus scelerisque at dui malesuada pharetra. Mauris interdum, ligula vel placerat imperdiet, velit est eleifend sem, sit amet rutrum elit eros at massa. Praesent at sagittis felis. Curabitur tincidunt accumsan turpis, ut laoreet orci porta et. Donec ac nisl eu lectus rhoncus lacinia vel vitae nulla. Etiam dapibus viverra erat, eget pellentesque velit pharetra eget. In eget finibus magna, nec tincidunt nunc. Pellentesque augue magna, suscipit blandit venenatis quis, fringilla eget mauris. Pellentesque eu elit tincidunt, dignissim nisi vel, egestas mi.Nunc ac nulla at felis dignissim tempus sit amet efficitur leo. Fusce commodo in ipsum id dignissim. Suspendisse ultrices volutpat orci aliquam ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse rutrum feugiat finibus. Donec tempor augue nunc, sed tincidunt nisl egestas sed. Phasellus non orci hendrerit, condimentum quam sit amet, venenatis sem. Nulla nec iaculis lorem. Cras accumsan purus est, vel viverra augue vestibulum in. Curabitur in ex vestibulum, semper ante sit amet, dignissim sapien. Sed hendrerit mi eget tincidunt vestibulum. Nulla mollis a ante in congue.",
    },
    19 : {
      "license": "IHW0008",
      "status": 1,
      "startDate": "01/10/2002",
      "endDate": "01/10/2050",
      "serviceType": "BALANCEAMENTO",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eleifend porta mauris, id pellentesque turpis semper semper. Vivamus scelerisque at dui malesuada pharetra. Mauris interdum, ligula vel placerat imperdiet, velit est eleifend sem, sit amet rutrum elit eros at massa. Praesent at sagittis felis. Curabitur tincidunt accumsan turpis, ut laoreet orci porta et. Donec ac nisl eu lectus rhoncus lacinia vel vitae nulla. Etiam dapibus viverra erat, eget pellentesque velit pharetra eget. In eget finibus magna, nec tincidunt nunc. Pellentesque augue magna, suscipit blandit venenatis quis, fringilla eget mauris. Pellentesque eu elit tincidunt, dignissim nisi vel, egestas mi.Nunc ac nulla at felis dignissim tempus sit amet efficitur leo. Fusce commodo in ipsum id dignissim. Suspendisse ultrices volutpat orci aliquam ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse rutrum feugiat finibus. Donec tempor augue nunc, sed tincidunt nisl egestas sed. Phasellus non orci hendrerit, condimentum quam sit amet, venenatis sem. Nulla nec iaculis lorem. Cras accumsan purus est, vel viverra augue vestibulum in. Curabitur in ex vestibulum, semper ante sit amet, dignissim sapien. Sed hendrerit mi eget tincidunt vestibulum. Nulla mollis a ante in congue.",
    },
    20 : {
      "license": "IHW0008",
      "status": 3,
      "startDate": "01/10/2002",
      "endDate": "01/10/2050",
      "serviceType": "BALANCEAMENTO",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eleifend porta mauris, id pellentesque turpis semper semper. Vivamus scelerisque at dui malesuada pharetra. Mauris interdum, ligula vel placerat imperdiet, velit est eleifend sem, sit amet rutrum elit eros at massa. Praesent at sagittis felis. Curabitur tincidunt accumsan turpis, ut laoreet orci porta et. Donec ac nisl eu lectus rhoncus lacinia vel vitae nulla. Etiam dapibus viverra erat, eget pellentesque velit pharetra eget. In eget finibus magna, nec tincidunt nunc. Pellentesque augue magna, suscipit blandit venenatis quis, fringilla eget mauris. Pellentesque eu elit tincidunt, dignissim nisi vel, egestas mi.Nunc ac nulla at felis dignissim tempus sit amet efficitur leo. Fusce commodo in ipsum id dignissim. Suspendisse ultrices volutpat orci aliquam ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse rutrum feugiat finibus. Donec tempor augue nunc, sed tincidunt nisl egestas sed. Phasellus non orci hendrerit, condimentum quam sit amet, venenatis sem. Nulla nec iaculis lorem. Cras accumsan purus est, vel viverra augue vestibulum in. Curabitur in ex vestibulum, semper ante sit amet, dignissim sapien. Sed hendrerit mi eget tincidunt vestibulum. Nulla mollis a ante in congue.",
    },
    21 : {
      "license": "IHW0008",
      "status": 5,
      "startDate": "01/10/2002",
      "endDate": "01/10/2050",
      "serviceType": "BALANCEAMENTO",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eleifend porta mauris, id pellentesque turpis semper semper. Vivamus scelerisque at dui malesuada pharetra. Mauris interdum, ligula vel placerat imperdiet, velit est eleifend sem, sit amet rutrum elit eros at massa. Praesent at sagittis felis. Curabitur tincidunt accumsan turpis, ut laoreet orci porta et. Donec ac nisl eu lectus rhoncus lacinia vel vitae nulla. Etiam dapibus viverra erat, eget pellentesque velit pharetra eget. In eget finibus magna, nec tincidunt nunc. Pellentesque augue magna, suscipit blandit venenatis quis, fringilla eget mauris. Pellentesque eu elit tincidunt, dignissim nisi vel, egestas mi.Nunc ac nulla at felis dignissim tempus sit amet efficitur leo. Fusce commodo in ipsum id dignissim. Suspendisse ultrices volutpat orci aliquam ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse rutrum feugiat finibus. Donec tempor augue nunc, sed tincidunt nisl egestas sed. Phasellus non orci hendrerit, condimentum quam sit amet, venenatis sem. Nulla nec iaculis lorem. Cras accumsan purus est, vel viverra augue vestibulum in. Curabitur in ex vestibulum, semper ante sit amet, dignissim sapien. Sed hendrerit mi eget tincidunt vestibulum. Nulla mollis a ante in congue.",
    },
    22 : {
      "license": "IHW0008",
      "status": 6,
      "startDate": "01/10/2002",
      "endDate": "01/10/2050",
      "serviceType": "BALANCEAMENTO",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eleifend porta mauris, id pellentesque turpis semper semper. Vivamus scelerisque at dui malesuada pharetra. Mauris interdum, ligula vel placerat imperdiet, velit est eleifend sem, sit amet rutrum elit eros at massa. Praesent at sagittis felis. Curabitur tincidunt accumsan turpis, ut laoreet orci porta et. Donec ac nisl eu lectus rhoncus lacinia vel vitae nulla. Etiam dapibus viverra erat, eget pellentesque velit pharetra eget. In eget finibus magna, nec tincidunt nunc. Pellentesque augue magna, suscipit blandit venenatis quis, fringilla eget mauris. Pellentesque eu elit tincidunt, dignissim nisi vel, egestas mi.Nunc ac nulla at felis dignissim tempus sit amet efficitur leo. Fusce commodo in ipsum id dignissim. Suspendisse ultrices volutpat orci aliquam ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse rutrum feugiat finibus. Donec tempor augue nunc, sed tincidunt nisl egestas sed. Phasellus non orci hendrerit, condimentum quam sit amet, venenatis sem. Nulla nec iaculis lorem. Cras accumsan purus est, vel viverra augue vestibulum in. Curabitur in ex vestibulum, semper ante sit amet, dignissim sapien. Sed hendrerit mi eget tincidunt vestibulum. Nulla mollis a ante in congue.",
    },
    23 : {
      "license": "IHW0008",
      "status": 6,
      "startDate": "01/10/2002",
      "endDate": "01/10/2050",
      "serviceType": "BALANCEAMENTO",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eleifend porta mauris, id pellentesque turpis semper semper. Vivamus scelerisque at dui malesuada pharetra. Mauris interdum, ligula vel placerat imperdiet, velit est eleifend sem, sit amet rutrum elit eros at massa. Praesent at sagittis felis. Curabitur tincidunt accumsan turpis, ut laoreet orci porta et. Donec ac nisl eu lectus rhoncus lacinia vel vitae nulla. Etiam dapibus viverra erat, eget pellentesque velit pharetra eget. In eget finibus magna, nec tincidunt nunc. Pellentesque augue magna, suscipit blandit venenatis quis, fringilla eget mauris. Pellentesque eu elit tincidunt, dignissim nisi vel, egestas mi.Nunc ac nulla at felis dignissim tempus sit amet efficitur leo. Fusce commodo in ipsum id dignissim. Suspendisse ultrices volutpat orci aliquam ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse rutrum feugiat finibus. Donec tempor augue nunc, sed tincidunt nisl egestas sed. Phasellus non orci hendrerit, condimentum quam sit amet, venenatis sem. Nulla nec iaculis lorem. Cras accumsan purus est, vel viverra augue vestibulum in. Curabitur in ex vestibulum, semper ante sit amet, dignissim sapien. Sed hendrerit mi eget tincidunt vestibulum. Nulla mollis a ante in congue.",
    },
    24 : {
      "license": "IHW0008",
      "status": 7,
      "startDate": "01/10/2002",
      "endDate": "01/10/2050",
      "serviceType": "BALANCEAMENTO",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eleifend porta mauris, id pellentesque turpis semper semper. Vivamus scelerisque at dui malesuada pharetra. Mauris interdum, ligula vel placerat imperdiet, velit est eleifend sem, sit amet rutrum elit eros at massa. Praesent at sagittis felis. Curabitur tincidunt accumsan turpis, ut laoreet orci porta et. Donec ac nisl eu lectus rhoncus lacinia vel vitae nulla. Etiam dapibus viverra erat, eget pellentesque velit pharetra eget. In eget finibus magna, nec tincidunt nunc. Pellentesque augue magna, suscipit blandit venenatis quis, fringilla eget mauris. Pellentesque eu elit tincidunt, dignissim nisi vel, egestas mi.Nunc ac nulla at felis dignissim tempus sit amet efficitur leo. Fusce commodo in ipsum id dignissim. Suspendisse ultrices volutpat orci aliquam ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse rutrum feugiat finibus. Donec tempor augue nunc, sed tincidunt nisl egestas sed. Phasellus non orci hendrerit, condimentum quam sit amet, venenatis sem. Nulla nec iaculis lorem. Cras accumsan purus est, vel viverra augue vestibulum in. Curabitur in ex vestibulum, semper ante sit amet, dignissim sapien. Sed hendrerit mi eget tincidunt vestibulum. Nulla mollis a ante in congue.",
    },
  };
}