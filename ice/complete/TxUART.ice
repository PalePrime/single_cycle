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
          "id": "e2d85100-a70d-426b-bc30-3d959c54e638",
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
            "x": 560,
            "y": 320
          }
        },
        {
          "id": "f936b1be-df8f-4a75-a927-5882c479d37b",
          "type": "basic.output",
          "data": {
            "name": "tx_rdy",
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
            "x": 1536,
            "y": 368
          }
        },
        {
          "id": "650de7c2-e71b-42f4-bab1-e690a2cbac1c",
          "type": "basic.input",
          "data": {
            "name": "data",
            "virtual": true,
            "range": "[7:0]",
            "pins": [
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
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
            "name": "txd",
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
            "x": 1528,
            "y": 648
          }
        },
        {
          "id": "b70b0d56-a2d4-4849-bda8-598a50f79368",
          "type": "basic.input",
          "data": {
            "name": "tx_wr",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
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
  },
  "dependencies": {}
}