{
  "version": "1.2",
  "package": {
    "name": "",
    "version": "",
    "description": "",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "ulx3s-85f",
    "graph": {
      "blocks": [
        {
          "id": "d2a66f27-550b-4412-a38d-a364168ef27c",
          "type": "basic.output",
          "data": {
            "name": "LED",
            "virtual": false,
            "range": "[7:0]",
            "pins": [
              {
                "index": "7",
                "name": "led_7",
                "value": "H3"
              },
              {
                "index": "6",
                "name": "led_6",
                "value": "E1"
              },
              {
                "index": "5",
                "name": "led_5",
                "value": "E2"
              },
              {
                "index": "4",
                "name": "led_4",
                "value": "D1"
              },
              {
                "index": "3",
                "name": "led_3",
                "value": "D2"
              },
              {
                "index": "2",
                "name": "led_2",
                "value": "C1"
              },
              {
                "index": "1",
                "name": "led_1",
                "value": "C2"
              },
              {
                "index": "0",
                "name": "led_0",
                "value": "B2"
              }
            ]
          },
          "position": {
            "x": 888,
            "y": -88
          }
        },
        {
          "id": "14fac183-bea6-40a4-9794-fb5e986dccc4",
          "type": "basic.input",
          "data": {
            "name": "RXD",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "ftdi_txd",
                "value": "M1"
              }
            ],
            "clock": false
          },
          "position": {
            "x": 432,
            "y": 352
          }
        },
        {
          "id": "c395a69b-3b51-491e-85fd-8e2cb068a21a",
          "type": "basic.output",
          "data": {
            "name": "txd",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "ftdi_rxd",
                "value": "L4"
              }
            ]
          },
          "position": {
            "x": 1272,
            "y": 352
          }
        },
        {
          "id": "cdf0ec4d-658b-40e8-9e56-38235feb84fa",
          "type": "basic.constant",
          "data": {
            "name": "rx_div",
            "value": "217",
            "local": false
          },
          "position": {
            "x": 640,
            "y": 176
          }
        },
        {
          "id": "8eb8d9a6-f8b2-4099-b9fd-4fcfdf4925d8",
          "type": "basic.constant",
          "data": {
            "name": "tx_div",
            "value": "210",
            "local": false
          },
          "position": {
            "x": 1088,
            "y": 160
          }
        },
        {
          "id": "a9293f67-41e0-42a3-9f73-65f5b3b44775",
          "type": "c0fca787424ff76fbf77d3518edc40ed0e8404da",
          "position": {
            "x": 640,
            "y": 336
          },
          "size": {
            "width": 96,
            "height": 96
          }
        },
        {
          "id": "9273afbe-8ee7-4c5c-9543-f921a5a1e1e8",
          "type": "3f68dbc7424c55584a4d2cffeb7b44481ce398c4",
          "position": {
            "x": 1088,
            "y": 312
          },
          "size": {
            "width": 96,
            "height": 96
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "14fac183-bea6-40a4-9794-fb5e986dccc4",
            "port": "out"
          },
          "target": {
            "block": "a9293f67-41e0-42a3-9f73-65f5b3b44775",
            "port": "5bf702a8-17d0-4562-a585-888447cc340b"
          }
        },
        {
          "source": {
            "block": "a9293f67-41e0-42a3-9f73-65f5b3b44775",
            "port": "144e3950-75fa-4afc-b321-4e08d2ce9f0b"
          },
          "target": {
            "block": "a9293f67-41e0-42a3-9f73-65f5b3b44775",
            "port": "8914ed41-cd34-48df-8ed5-bc2eed80848e"
          }
        },
        {
          "source": {
            "block": "a9293f67-41e0-42a3-9f73-65f5b3b44775",
            "port": "4cae6933-14a8-4f16-b5f4-7eaa9db6053f"
          },
          "target": {
            "block": "9273afbe-8ee7-4c5c-9543-f921a5a1e1e8",
            "port": "650de7c2-e71b-42f4-bab1-e690a2cbac1c"
          },
          "size": 8
        },
        {
          "source": {
            "block": "a9293f67-41e0-42a3-9f73-65f5b3b44775",
            "port": "144e3950-75fa-4afc-b321-4e08d2ce9f0b"
          },
          "target": {
            "block": "9273afbe-8ee7-4c5c-9543-f921a5a1e1e8",
            "port": "b70b0d56-a2d4-4849-bda8-598a50f79368"
          }
        },
        {
          "source": {
            "block": "9273afbe-8ee7-4c5c-9543-f921a5a1e1e8",
            "port": "5d069990-da9c-4ddb-8b6c-ee9ecf892bb4"
          },
          "target": {
            "block": "c395a69b-3b51-491e-85fd-8e2cb068a21a",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "cdf0ec4d-658b-40e8-9e56-38235feb84fa",
            "port": "constant-out"
          },
          "target": {
            "block": "a9293f67-41e0-42a3-9f73-65f5b3b44775",
            "port": "2fb682b8-a7cf-4e63-b2bd-c0292bc22070"
          }
        },
        {
          "source": {
            "block": "8eb8d9a6-f8b2-4099-b9fd-4fcfdf4925d8",
            "port": "constant-out"
          },
          "target": {
            "block": "9273afbe-8ee7-4c5c-9543-f921a5a1e1e8",
            "port": "2bdea0e3-40f4-4aef-9294-fd5466bc70ee"
          }
        },
        {
          "source": {
            "block": "a9293f67-41e0-42a3-9f73-65f5b3b44775",
            "port": "4cae6933-14a8-4f16-b5f4-7eaa9db6053f"
          },
          "target": {
            "block": "d2a66f27-550b-4412-a38d-a364168ef27c",
            "port": "in"
          },
          "size": 8
        }
      ]
    }
  },
  "dependencies": {
    "c0fca787424ff76fbf77d3518edc40ed0e8404da": {
      "package": {
        "name": "",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "39c93480-212d-4b37-9a1e-d98ddd598ddb",
              "type": "basic.input",
              "data": {
                "name": "clk",
                "virtual": true,
                "pins": [
                  {
                    "index": "0",
                    "name": "NULL",
                    "value": "NULL"
                  }
                ],
                "clock": true
              },
              "position": {
                "x": 376,
                "y": 224
              }
            },
            {
              "id": "4cae6933-14a8-4f16-b5f4-7eaa9db6053f",
              "type": "basic.output",
              "data": {
                "name": "data",
                "range": "[7:0]",
                "size": 8
              },
              "position": {
                "x": 1800,
                "y": 296
              }
            },
            {
              "id": "5bf702a8-17d0-4562-a585-888447cc340b",
              "type": "basic.input",
              "data": {
                "name": "rxd",
                "clock": false
              },
              "position": {
                "x": 376,
                "y": 504
              }
            },
            {
              "id": "144e3950-75fa-4afc-b321-4e08d2ce9f0b",
              "type": "basic.output",
              "data": {
                "name": "rx_rdy"
              },
              "position": {
                "x": 1800,
                "y": 704
              }
            },
            {
              "id": "8914ed41-cd34-48df-8ed5-bc2eed80848e",
              "type": "basic.input",
              "data": {
                "name": "rx_rd",
                "clock": false
              },
              "position": {
                "x": 384,
                "y": 776
              }
            },
            {
              "id": "2fb682b8-a7cf-4e63-b2bd-c0292bc22070",
              "type": "basic.constant",
              "data": {
                "name": "div",
                "value": "217",
                "local": false
              },
              "position": {
                "x": 1096,
                "y": 16
              }
            },
            {
              "id": "35c00853-f024-4c0b-9ccc-1dc866d5a17f",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "rxd"
                    },
                    {
                      "name": "rx_rd"
                    }
                  ],
                  "out": [
                    {
                      "name": "data",
                      "range": "[7:0]",
                      "size": 8
                    },
                    {
                      "name": "rx_rdy"
                    }
                  ]
                },
                "params": [
                  {
                    "name": "div"
                  }
                ],
                "code": "localparam baud_div = div;\n\nlogic [6:0]  pattern;\nlogic [6:0]  next_pattern;\nlogic [3:0]  bitcnt;\nlogic [3:0]  next_bitcnt;\nlogic [31:0] divcnt;\nlogic [31:0] next_divcnt;\nlogic [7:0]  next_data;\nlogic        next_rdy;\nlogic        last_rx_rd;\n\nalways_comb begin\n    next_rdy  = rx_rdy;\n\tif (rx_rd && ~last_rx_rd && rx_rdy) begin\n\t\tnext_rdy = 0;\n\tend\n\tnext_pattern = pattern;\n    next_data = data;\n    if (divcnt == 0) begin\n        next_bitcnt = bitcnt - 1;\n        next_divcnt = 0;\n        next_pattern = {rxd, pattern[6:1]};\n        if (bitcnt == 0) begin\n            if (rxd == 0) begin\n                next_bitcnt = 10;\n                next_divcnt = div >> 1;\n            end else begin\n                next_bitcnt = 0;\n            end\n        end else begin\n            next_divcnt = div;\n\t        if (bitcnt == 2) begin\n\t            next_data   = {rxd, pattern};\n\t            next_rdy    = 1;\n\t        end\n        end\n    end else begin\n        next_bitcnt = bitcnt;\n\t    if (bitcnt == 1 && rxd == 1) \n\t        next_divcnt = 0;\n\t    else\n\t        next_divcnt = divcnt - 1;\n    end\nend\n\nalways_ff @(posedge clk) begin\n    last_rx_rd <= rx_rd;\n    bitcnt     <= next_bitcnt;\n    divcnt     <= next_divcnt;\n    pattern    <= next_pattern;\n    data       <= next_data;\n    rx_rdy     <= next_rdy;\nend\n"
              },
              "position": {
                "x": 576,
                "y": 120
              },
              "size": {
                "width": 1128,
                "height": 824
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "5bf702a8-17d0-4562-a585-888447cc340b",
                "port": "out"
              },
              "target": {
                "block": "35c00853-f024-4c0b-9ccc-1dc866d5a17f",
                "port": "rxd"
              }
            },
            {
              "source": {
                "block": "8914ed41-cd34-48df-8ed5-bc2eed80848e",
                "port": "out"
              },
              "target": {
                "block": "35c00853-f024-4c0b-9ccc-1dc866d5a17f",
                "port": "rx_rd"
              }
            },
            {
              "source": {
                "block": "2fb682b8-a7cf-4e63-b2bd-c0292bc22070",
                "port": "constant-out"
              },
              "target": {
                "block": "35c00853-f024-4c0b-9ccc-1dc866d5a17f",
                "port": "div"
              }
            },
            {
              "source": {
                "block": "35c00853-f024-4c0b-9ccc-1dc866d5a17f",
                "port": "data"
              },
              "target": {
                "block": "4cae6933-14a8-4f16-b5f4-7eaa9db6053f",
                "port": "in"
              },
              "size": 8
            },
            {
              "source": {
                "block": "35c00853-f024-4c0b-9ccc-1dc866d5a17f",
                "port": "rx_rdy"
              },
              "target": {
                "block": "144e3950-75fa-4afc-b321-4e08d2ce9f0b",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "39c93480-212d-4b37-9a1e-d98ddd598ddb",
                "port": "out"
              },
              "target": {
                "block": "35c00853-f024-4c0b-9ccc-1dc866d5a17f",
                "port": "clk"
              }
            }
          ]
        }
      }
    },
    "3f68dbc7424c55584a4d2cffeb7b44481ce398c4": {
      "package": {
        "name": "",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "e2d85100-a70d-426b-bc30-3d959c54e638",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true
              },
              "position": {
                "x": 560,
                "y": 320
              }
            },
            {
              "id": "f936b1be-df8f-4a75-a927-5882c479d37b",
              "type": "basic.output",
              "data": {
                "name": "tx_rdy"
              },
              "position": {
                "x": 1536,
                "y": 368
              }
            },
            {
              "id": "650de7c2-e71b-42f4-bab1-e690a2cbac1c",
              "type": "basic.input",
              "data": {
                "name": "data",
                "range": "[7:0]",
                "clock": false,
                "size": 8
              },
              "position": {
                "x": 560,
                "y": 512
              }
            },
            {
              "id": "5d069990-da9c-4ddb-8b6c-ee9ecf892bb4",
              "type": "basic.output",
              "data": {
                "name": "txd"
              },
              "position": {
                "x": 1528,
                "y": 648
              }
            },
            {
              "id": "b70b0d56-a2d4-4849-bda8-598a50f79368",
              "type": "basic.input",
              "data": {
                "name": "tx_wr",
                "clock": false
              },
              "position": {
                "x": 560,
                "y": 696
              }
            },
            {
              "id": "2bdea0e3-40f4-4aef-9294-fd5466bc70ee",
              "type": "basic.constant",
              "data": {
                "name": "div",
                "value": "217",
                "local": false
              },
              "position": {
                "x": 1064,
                "y": 112
              }
            },
            {
              "id": "5d2b56a3-ab7b-4716-ae52-45b07d9d3a08",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "data",
                      "range": "[7:0]",
                      "size": 8
                    },
                    {
                      "name": "tx_wr"
                    }
                  ],
                  "out": [
                    {
                      "name": "tx_rdy"
                    },
                    {
                      "name": "txd"
                    }
                  ]
                },
                "params": [
                  {
                    "name": "div"
                  }
                ],
                "code": "localparam baud_div = div;\n\nlogic [9:0]  tx_pattern = 10'b1;\nlogic [3:0]  tx_bitcnt;\nlogic [31:0] tx_divcnt;\nlogic        tx_last_wr;\n\nassign tx_rdy = tx_bitcnt == 0 && tx_divcnt == 0;\nassign txd    = tx_pattern[0];\n\nalways @(posedge clk) begin\n    tx_last_wr <= tx_wr;\n\ttx_divcnt  <= tx_divcnt == 0 ? 0 : tx_divcnt - 1;\n\tif (tx_wr && ~tx_last_wr) begin\n\t\ttx_pattern <= {1'b1, data, 1'b0};\n\t\ttx_bitcnt <= 10;\n\t\ttx_divcnt <= div;\n\tend else\n\tif (tx_divcnt == 0 && tx_bitcnt > 0) begin\n\t\ttx_pattern <= {1'b1, tx_pattern[9:1]};\n\t\ttx_bitcnt <= tx_bitcnt - 1;\n\t\ttx_divcnt <= div;\n\tend\nend"
              },
              "position": {
                "x": 744,
                "y": 256
              },
              "size": {
                "width": 728,
                "height": 568
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "5d2b56a3-ab7b-4716-ae52-45b07d9d3a08",
                "port": "txd"
              },
              "target": {
                "block": "5d069990-da9c-4ddb-8b6c-ee9ecf892bb4",
                "port": "in"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "650de7c2-e71b-42f4-bab1-e690a2cbac1c",
                "port": "out"
              },
              "target": {
                "block": "5d2b56a3-ab7b-4716-ae52-45b07d9d3a08",
                "port": "data"
              },
              "vertices": [],
              "size": 8
            },
            {
              "source": {
                "block": "2bdea0e3-40f4-4aef-9294-fd5466bc70ee",
                "port": "constant-out"
              },
              "target": {
                "block": "5d2b56a3-ab7b-4716-ae52-45b07d9d3a08",
                "port": "div"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "e2d85100-a70d-426b-bc30-3d959c54e638",
                "port": "out"
              },
              "target": {
                "block": "5d2b56a3-ab7b-4716-ae52-45b07d9d3a08",
                "port": "clk"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "b70b0d56-a2d4-4849-bda8-598a50f79368",
                "port": "out"
              },
              "target": {
                "block": "5d2b56a3-ab7b-4716-ae52-45b07d9d3a08",
                "port": "tx_wr"
              }
            },
            {
              "source": {
                "block": "5d2b56a3-ab7b-4716-ae52-45b07d9d3a08",
                "port": "tx_rdy"
              },
              "target": {
                "block": "f936b1be-df8f-4a75-a927-5882c479d37b",
                "port": "in"
              }
            }
          ]
        }
      }
    }
  }
}