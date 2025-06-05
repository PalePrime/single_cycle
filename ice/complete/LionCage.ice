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
          "id": "57a1b9cf-e1c3-4168-a8bf-77c52680b479",
          "type": "basic.input",
          "data": {
            "name": "G1",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "btn_1",
                "value": "R1"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -216,
            "y": -168
          }
        },
        {
          "id": "c5daffdd-a73b-44b8-badc-2351cd156428",
          "type": "basic.output",
          "data": {
            "name": "GoOut",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "led_7",
                "value": "H3"
              }
            ]
          },
          "position": {
            "x": 216,
            "y": -168
          }
        },
        {
          "id": "a92ef611-82b7-4aa2-9eef-eaa215aa3149",
          "type": "basic.input",
          "data": {
            "name": "G2",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "btn_2",
                "value": "T1"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -216,
            "y": -88
          }
        },
        {
          "id": "b99835fc-63bd-4d3f-94fb-a2ec0a36cd82",
          "type": "basic.output",
          "data": {
            "name": "GoIn",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "led_6",
                "value": "E1"
              }
            ]
          },
          "position": {
            "x": 216,
            "y": -88
          }
        },
        {
          "id": "99aea8e1-b725-4e1e-a7ca-a1c546a58678",
          "type": "basic.output",
          "data": {
            "name": "State",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "led_5",
                "value": "E2"
              }
            ]
          },
          "position": {
            "x": 216,
            "y": -8
          }
        },
        {
          "id": "303d6e62-eeb0-4bfe-be73-883c8fc64976",
          "type": "basic.output",
          "data": {
            "name": "Disp",
            "virtual": false,
            "range": "[3:0]",
            "pins": [
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
            "x": 376,
            "y": 112
          }
        },
        {
          "id": "9b273df7-5034-450c-90a7-0a0a9ba38edc",
          "type": "8a93df69475b3074d1e8b5f0d92f6a170c61080d",
          "position": {
            "x": 0,
            "y": -104
          },
          "size": {
            "width": 96,
            "height": 96
          }
        },
        {
          "id": "472cbdd4-2b62-4fa9-b130-28a5e5d3224e",
          "type": "a312eae676b7451917f674e4d25cc444cb1d0aba",
          "position": {
            "x": 216,
            "y": 144
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
            "block": "a92ef611-82b7-4aa2-9eef-eaa215aa3149",
            "port": "out"
          },
          "target": {
            "block": "9b273df7-5034-450c-90a7-0a0a9ba38edc",
            "port": "ca911d60-fc18-4921-8c96-41fbffc2efe1"
          }
        },
        {
          "source": {
            "block": "57a1b9cf-e1c3-4168-a8bf-77c52680b479",
            "port": "out"
          },
          "target": {
            "block": "9b273df7-5034-450c-90a7-0a0a9ba38edc",
            "port": "ab473924-38ca-4cce-aa6a-fa675a22c3ac"
          }
        },
        {
          "source": {
            "block": "9b273df7-5034-450c-90a7-0a0a9ba38edc",
            "port": "00f1ddc0-828f-4f8d-b25d-1ef154d019ef"
          },
          "target": {
            "block": "c5daffdd-a73b-44b8-badc-2351cd156428",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "9b273df7-5034-450c-90a7-0a0a9ba38edc",
            "port": "bb4ec32d-c93e-42d8-bd7f-ebce62fc43d7"
          },
          "target": {
            "block": "b99835fc-63bd-4d3f-94fb-a2ec0a36cd82",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "9b273df7-5034-450c-90a7-0a0a9ba38edc",
            "port": "9cead06e-9ff4-4877-a5a1-4b46e07790b4"
          },
          "target": {
            "block": "99aea8e1-b725-4e1e-a7ca-a1c546a58678",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "9b273df7-5034-450c-90a7-0a0a9ba38edc",
            "port": "00f1ddc0-828f-4f8d-b25d-1ef154d019ef"
          },
          "target": {
            "block": "472cbdd4-2b62-4fa9-b130-28a5e5d3224e",
            "port": "fb6f62ee-398d-4410-9fb4-1c27080436b7"
          }
        },
        {
          "source": {
            "block": "9b273df7-5034-450c-90a7-0a0a9ba38edc",
            "port": "bb4ec32d-c93e-42d8-bd7f-ebce62fc43d7"
          },
          "target": {
            "block": "472cbdd4-2b62-4fa9-b130-28a5e5d3224e",
            "port": "66928301-1c5b-44de-854c-07c8fced8598"
          }
        },
        {
          "source": {
            "block": "472cbdd4-2b62-4fa9-b130-28a5e5d3224e",
            "port": "b48dabd2-f48e-4272-b31d-cfc4f7b89ad1"
          },
          "target": {
            "block": "303d6e62-eeb0-4bfe-be73-883c8fc64976",
            "port": "in"
          },
          "size": 4
        }
      ]
    }
  },
  "dependencies": {
    "8a93df69475b3074d1e8b5f0d92f6a170c61080d": {
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
              "id": "ab473924-38ca-4cce-aa6a-fa675a22c3ac",
              "type": "basic.input",
              "data": {
                "name": "G1",
                "clock": false
              },
              "position": {
                "x": -8,
                "y": -8
              }
            },
            {
              "id": "00f1ddc0-828f-4f8d-b25d-1ef154d019ef",
              "type": "basic.output",
              "data": {
                "name": "GoOut"
              },
              "position": {
                "x": 1112,
                "y": -8
              }
            },
            {
              "id": "ca911d60-fc18-4921-8c96-41fbffc2efe1",
              "type": "basic.input",
              "data": {
                "name": "G2",
                "clock": false
              },
              "position": {
                "x": -8,
                "y": 176
              }
            },
            {
              "id": "bb4ec32d-c93e-42d8-bd7f-ebce62fc43d7",
              "type": "basic.output",
              "data": {
                "name": "GoIn"
              },
              "position": {
                "x": 1112,
                "y": 176
              }
            },
            {
              "id": "b255e9b5-6df1-4f77-aecc-1e96447d92a1",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true
              },
              "position": {
                "x": -16,
                "y": 360
              }
            },
            {
              "id": "9cead06e-9ff4-4877-a5a1-4b46e07790b4",
              "type": "basic.output",
              "data": {
                "name": "State",
                "virtual": true,
                "pins": [
                  {
                    "index": "0",
                    "name": "NULL",
                    "value": "NULL"
                  }
                ]
              },
              "position": {
                "x": 1112,
                "y": 360
              }
            },
            {
              "id": "ba422108-cdbf-403c-9d1f-3d4cde8fa90d",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "G1"
                    },
                    {
                      "name": "G2"
                    },
                    {
                      "name": "clk"
                    }
                  ],
                  "out": [
                    {
                      "name": "GoOut"
                    },
                    {
                      "name": "GoIn"
                    },
                    {
                      "name": "spy_on_internal_state"
                    }
                  ]
                },
                "params": [],
                "code": "// Remember last value of G1\nlogic Last_G1;\n\nalways_ff @(posedge clk)\n    Last_G1 <= G1;\n\n// Make Last_G1 visible    \nassign spy_on_internal_state = Last_G1;\n\n// Go out means G1 becomes active\n// while G2 is inactive\nassign GoOut = ~Last_G1 &  G1 & ~G2;\n\n// Go in means G1 becomes inactive\n// while G2 is inactive\nassign GoIn  =  Last_G1 & ~G1 & ~G2;"
              },
              "position": {
                "x": 152,
                "y": -72
              },
              "size": {
                "width": 800,
                "height": 552
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "b255e9b5-6df1-4f77-aecc-1e96447d92a1",
                "port": "out"
              },
              "target": {
                "block": "ba422108-cdbf-403c-9d1f-3d4cde8fa90d",
                "port": "clk"
              }
            },
            {
              "source": {
                "block": "ab473924-38ca-4cce-aa6a-fa675a22c3ac",
                "port": "out"
              },
              "target": {
                "block": "ba422108-cdbf-403c-9d1f-3d4cde8fa90d",
                "port": "G1"
              }
            },
            {
              "source": {
                "block": "ca911d60-fc18-4921-8c96-41fbffc2efe1",
                "port": "out"
              },
              "target": {
                "block": "ba422108-cdbf-403c-9d1f-3d4cde8fa90d",
                "port": "G2"
              }
            },
            {
              "source": {
                "block": "ba422108-cdbf-403c-9d1f-3d4cde8fa90d",
                "port": "GoOut"
              },
              "target": {
                "block": "00f1ddc0-828f-4f8d-b25d-1ef154d019ef",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "ba422108-cdbf-403c-9d1f-3d4cde8fa90d",
                "port": "GoIn"
              },
              "target": {
                "block": "bb4ec32d-c93e-42d8-bd7f-ebce62fc43d7",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "ba422108-cdbf-403c-9d1f-3d4cde8fa90d",
                "port": "spy_on_internal_state"
              },
              "target": {
                "block": "9cead06e-9ff4-4877-a5a1-4b46e07790b4",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "a312eae676b7451917f674e4d25cc444cb1d0aba": {
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
              "id": "fb6f62ee-398d-4410-9fb4-1c27080436b7",
              "type": "basic.input",
              "data": {
                "name": "Up",
                "clock": false
              },
              "position": {
                "x": 120,
                "y": 208
              }
            },
            {
              "id": "b48dabd2-f48e-4272-b31d-cfc4f7b89ad1",
              "type": "basic.output",
              "data": {
                "name": "Disp",
                "range": "[3:0]",
                "size": 4
              },
              "position": {
                "x": 944,
                "y": 288
              }
            },
            {
              "id": "66928301-1c5b-44de-854c-07c8fced8598",
              "type": "basic.input",
              "data": {
                "name": "Down",
                "clock": false
              },
              "position": {
                "x": 120,
                "y": 336
              }
            },
            {
              "id": "eb673f9b-a74e-43e8-b4c0-878539e3f433",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true
              },
              "position": {
                "x": 120,
                "y": 456
              }
            },
            {
              "id": "561a5b82-4a86-445e-ae0c-72b12acc5486",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "Up"
                    },
                    {
                      "name": "Down"
                    },
                    {
                      "name": "Clk"
                    }
                  ],
                  "out": [
                    {
                      "name": "Count",
                      "range": "[3:0]",
                      "size": 4
                    }
                  ]
                },
                "params": [],
                "code": "initial begin\n  Count = 0;\nend;\n\nalways_ff @(posedge Clk) begin\n  case({Up, Down})\n    2'b10:   Count <= Count + 1;\n    2'b01:   Count <= Count - 1;\n    2'b11:   Count <= 0;\n    default: Count <= Count;\n  endcase;\nend;\n"
              },
              "position": {
                "x": 304,
                "y": 176
              },
              "size": {
                "width": 544,
                "height": 376
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "fb6f62ee-398d-4410-9fb4-1c27080436b7",
                "port": "out"
              },
              "target": {
                "block": "561a5b82-4a86-445e-ae0c-72b12acc5486",
                "port": "Up"
              }
            },
            {
              "source": {
                "block": "66928301-1c5b-44de-854c-07c8fced8598",
                "port": "out"
              },
              "target": {
                "block": "561a5b82-4a86-445e-ae0c-72b12acc5486",
                "port": "Down"
              }
            },
            {
              "source": {
                "block": "561a5b82-4a86-445e-ae0c-72b12acc5486",
                "port": "Count"
              },
              "target": {
                "block": "b48dabd2-f48e-4272-b31d-cfc4f7b89ad1",
                "port": "in"
              },
              "size": 4
            },
            {
              "source": {
                "block": "eb673f9b-a74e-43e8-b4c0-878539e3f433",
                "port": "out"
              },
              "target": {
                "block": "561a5b82-4a86-445e-ae0c-72b12acc5486",
                "port": "Clk"
              }
            }
          ]
        }
      }
    }
  }
}