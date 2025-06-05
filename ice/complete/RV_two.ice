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
          "id": "15eeda00-4fd2-432b-b318-e7900250172c",
          "type": "basic.input",
          "data": {
            "name": "Reset_btn",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "btn_0",
                "value": "D6"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -368,
            "y": 240
          }
        },
        {
          "id": "44a0d4d6-35d4-42f9-8023-1d982bf46cd3",
          "type": "basic.output",
          "data": {
            "name": "led",
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
            "x": 1584,
            "y": 416
          }
        },
        {
          "id": "6f50204c-b6b0-4677-b94a-e444c69ffabf",
          "type": "basic.constant",
          "data": {
            "name": "Divider",
            "value": "1",
            "local": false
          },
          "position": {
            "x": -368,
            "y": -80
          }
        },
        {
          "id": "12653887-b792-4f5c-b3bb-f17e73a8f0c5",
          "type": "basic.memory",
          "data": {
            "name": "Program",
            "list": "00a00293\n00001337\n00229393\n00730e33\n005e2023\nfff28293\nfe02d8e3\n0000006f\n",
            "local": false,
            "format": 16
          },
          "position": {
            "x": -320,
            "y": 352
          },
          "size": {
            "width": 432,
            "height": 440
          }
        },
        {
          "id": "5d41ff37-3d15-4114-a08e-c3206715f3fd",
          "type": "basic.constant",
          "data": {
            "name": "ABits",
            "value": "5",
            "local": false
          },
          "position": {
            "x": 416,
            "y": 328
          }
        },
        {
          "id": "d8ff3f83-0a22-448d-895f-5e3f2340e57a",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "CurrentPC",
                  "range": "[31:0]",
                  "size": 32
                },
                {
                  "name": "reset"
                }
              ],
              "out": [
                {
                  "name": "NextPC",
                  "range": "[31:0]",
                  "size": 32
                }
              ]
            },
            "params": [],
            "code": "always_comb begin : Next_PC\n    if (reset) NextPC = 0;\n    //else if (doJump | doBranch) NextPC = targetPC;\n    else NextPC = CurrentPC + 4;\nend\n"
          },
          "position": {
            "x": 984,
            "y": -48
          },
          "size": {
            "width": 688,
            "height": 384
          }
        },
        {
          "id": "e56a25f8-9e22-4332-be20-b2e0a2399a9a",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "PCSpy",
                  "range": "[31:0]",
                  "size": 32
                }
              ],
              "out": [
                {
                  "name": "Leds",
                  "range": "[7:0]",
                  "size": 8
                }
              ]
            },
            "params": [],
            "code": "assign Leds = PCSpy[7:0];"
          },
          "position": {
            "x": 1056,
            "y": 488
          },
          "size": {
            "width": 296,
            "height": 144
          }
        },
        {
          "id": "f9646cab-08b9-4137-82fc-0f285612ff06",
          "type": "6a50747141af6d1cfb3bb9d0093fb94862ff5a65",
          "position": {
            "x": -368,
            "y": 16
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "f7598b66-47fe-4cb2-88f7-9a5f004ab6ac",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "NextPC",
                  "range": "[31:0]",
                  "size": 32
                },
                {
                  "name": "clk"
                },
                {
                  "name": "reset"
                }
              ],
              "out": [
                {
                  "name": "CurrentPC",
                  "range": "[31:0]",
                  "size": 32
                }
              ]
            },
            "params": [],
            "code": "always_ff @(posedge clk) begin\n    if (reset) CurrentPC <= 0;\n    else       CurrentPC <= NextPC;    \nend"
          },
          "position": {
            "x": 336,
            "y": -16
          },
          "size": {
            "width": 416,
            "height": 128
          }
        },
        {
          "id": "0ee1fcc4-ce0d-42de-a79d-706ebbd0bba8",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "clk"
                },
                {
                  "name": "reset_btn"
                }
              ],
              "out": [
                {
                  "name": "reset"
                }
              ]
            },
            "params": [],
            "code": "always_ff @(posedge clk) begin\n    reset <= ~reset_btn;    \nend\n"
          },
          "position": {
            "x": -184,
            "y": 176
          },
          "size": {
            "width": 360,
            "height": 128
          }
        },
        {
          "id": "c5365b0a-4a56-4d4a-899b-3c2d1ffe7275",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "IAddr",
                  "range": "[31:0]",
                  "size": 32
                },
                {
                  "name": "clk"
                }
              ],
              "out": [
                {
                  "name": "IRData",
                  "range": "[31:0]",
                  "size": 32
                }
              ]
            },
            "params": [
              {
                "name": "ABits"
              },
              {
                "name": "MEM_INIT_FILE"
              }
            ],
            "code": "logic[31:0] RAM[2**(ABits-2)-1:0];\n\ninitial begin\n    if (MEM_INIT_FILE != \"\") begin\n        $readmemh(MEM_INIT_FILE, RAM);\n    end\nend\n\nalways_ff @(posedge clk) begin\n    IRData <= RAM[IAddr[(ABits-1):2]];\nend\n"
          },
          "position": {
            "x": 336,
            "y": 440
          },
          "size": {
            "width": 504,
            "height": 336
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "f7598b66-47fe-4cb2-88f7-9a5f004ab6ac",
            "port": "CurrentPC"
          },
          "target": {
            "block": "d8ff3f83-0a22-448d-895f-5e3f2340e57a",
            "port": "CurrentPC"
          },
          "vertices": [],
          "size": 32
        },
        {
          "source": {
            "block": "d8ff3f83-0a22-448d-895f-5e3f2340e57a",
            "port": "NextPC"
          },
          "target": {
            "block": "f7598b66-47fe-4cb2-88f7-9a5f004ab6ac",
            "port": "NextPC"
          },
          "vertices": [
            {
              "x": 320,
              "y": -128
            }
          ],
          "size": 32
        },
        {
          "source": {
            "block": "e56a25f8-9e22-4332-be20-b2e0a2399a9a",
            "port": "Leds"
          },
          "target": {
            "block": "44a0d4d6-35d4-42f9-8023-1d982bf46cd3",
            "port": "in"
          },
          "size": 8
        },
        {
          "source": {
            "block": "6f50204c-b6b0-4677-b94a-e444c69ffabf",
            "port": "constant-out"
          },
          "target": {
            "block": "f9646cab-08b9-4137-82fc-0f285612ff06",
            "port": "de2d8a2d-7908-48a2-9e35-7763a45886e4"
          }
        },
        {
          "source": {
            "block": "15eeda00-4fd2-432b-b318-e7900250172c",
            "port": "out"
          },
          "target": {
            "block": "0ee1fcc4-ce0d-42de-a79d-706ebbd0bba8",
            "port": "reset_btn"
          }
        },
        {
          "source": {
            "block": "0ee1fcc4-ce0d-42de-a79d-706ebbd0bba8",
            "port": "reset"
          },
          "target": {
            "block": "d8ff3f83-0a22-448d-895f-5e3f2340e57a",
            "port": "reset"
          }
        },
        {
          "source": {
            "block": "0ee1fcc4-ce0d-42de-a79d-706ebbd0bba8",
            "port": "reset"
          },
          "target": {
            "block": "f7598b66-47fe-4cb2-88f7-9a5f004ab6ac",
            "port": "reset"
          }
        },
        {
          "source": {
            "block": "d8ff3f83-0a22-448d-895f-5e3f2340e57a",
            "port": "NextPC"
          },
          "target": {
            "block": "c5365b0a-4a56-4d4a-899b-3c2d1ffe7275",
            "port": "IAddr"
          },
          "vertices": [
            {
              "x": 376,
              "y": -128
            }
          ],
          "size": 32
        },
        {
          "source": {
            "block": "5d41ff37-3d15-4114-a08e-c3206715f3fd",
            "port": "constant-out"
          },
          "target": {
            "block": "c5365b0a-4a56-4d4a-899b-3c2d1ffe7275",
            "port": "ABits"
          }
        },
        {
          "source": {
            "block": "12653887-b792-4f5c-b3bb-f17e73a8f0c5",
            "port": "memory-out"
          },
          "target": {
            "block": "c5365b0a-4a56-4d4a-899b-3c2d1ffe7275",
            "port": "MEM_INIT_FILE"
          },
          "vertices": [
            {
              "x": 184,
              "y": 360
            }
          ]
        },
        {
          "source": {
            "block": "c5365b0a-4a56-4d4a-899b-3c2d1ffe7275",
            "port": "IRData"
          },
          "target": {
            "block": "e56a25f8-9e22-4332-be20-b2e0a2399a9a",
            "port": "PCSpy"
          },
          "size": 32
        },
        {
          "source": {
            "block": "f9646cab-08b9-4137-82fc-0f285612ff06",
            "port": "7e07d449-6475-4839-b43e-8aead8be2aac"
          },
          "target": {
            "block": "f7598b66-47fe-4cb2-88f7-9a5f004ab6ac",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "f9646cab-08b9-4137-82fc-0f285612ff06",
            "port": "7e07d449-6475-4839-b43e-8aead8be2aac"
          },
          "target": {
            "block": "c5365b0a-4a56-4d4a-899b-3c2d1ffe7275",
            "port": "clk"
          },
          "vertices": [
            {
              "x": 256,
              "y": 376
            }
          ]
        },
        {
          "source": {
            "block": "f9646cab-08b9-4137-82fc-0f285612ff06",
            "port": "7e07d449-6475-4839-b43e-8aead8be2aac"
          },
          "target": {
            "block": "0ee1fcc4-ce0d-42de-a79d-706ebbd0bba8",
            "port": "clk"
          }
        }
      ]
    }
  },
  "dependencies": {
    "6a50747141af6d1cfb3bb9d0093fb94862ff5a65": {
      "package": {
        "name": "PrescalerN",
        "version": "0.1",
        "description": "Parametric N-bits prescaler",
        "author": "Juan Gonzalez (Obijuan)",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "e19c6f2f-5747-4ed1-87c8-748575f0cc10",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true
              },
              "position": {
                "x": 0,
                "y": 256
              }
            },
            {
              "id": "7e07d449-6475-4839-b43e-8aead8be2aac",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 720,
                "y": 256
              }
            },
            {
              "id": "de2d8a2d-7908-48a2-9e35-7763a45886e4",
              "type": "basic.constant",
              "data": {
                "name": "N",
                "value": "22",
                "local": false
              },
              "position": {
                "x": 352,
                "y": 56
              }
            },
            {
              "id": "2330955f-5ce6-4d1c-8ee4-0a09a0349389",
              "type": "basic.code",
              "data": {
                "code": "//-- Number of bits of the prescaler\n//parameter N = 22;\n\n//-- divisor register\nreg [N-1:0] divcounter;\n\n//-- N bit counter\nalways @(posedge clk_in)\n  divcounter <= divcounter + 1;\n\n//-- Use the most significant bit as output\nassign clk_out = divcounter[N-1];",
                "params": [
                  {
                    "name": "N"
                  }
                ],
                "ports": {
                  "in": [
                    {
                      "name": "clk_in"
                    }
                  ],
                  "out": [
                    {
                      "name": "clk_out"
                    }
                  ]
                }
              },
              "position": {
                "x": 176,
                "y": 176
              },
              "size": {
                "width": 448,
                "height": 224
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "2330955f-5ce6-4d1c-8ee4-0a09a0349389",
                "port": "clk_out"
              },
              "target": {
                "block": "7e07d449-6475-4839-b43e-8aead8be2aac",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "e19c6f2f-5747-4ed1-87c8-748575f0cc10",
                "port": "out"
              },
              "target": {
                "block": "2330955f-5ce6-4d1c-8ee4-0a09a0349389",
                "port": "clk_in"
              }
            },
            {
              "source": {
                "block": "de2d8a2d-7908-48a2-9e35-7763a45886e4",
                "port": "constant-out"
              },
              "target": {
                "block": "2330955f-5ce6-4d1c-8ee4-0a09a0349389",
                "port": "N"
              }
            }
          ]
        }
      }
    }
  }
}