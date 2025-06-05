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
            ]
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
            "x": 376,
            "y": 504
          }
        },
        {
          "id": "144e3950-75fa-4afc-b321-4e08d2ce9f0b",
          "type": "basic.output",
          "data": {
            "name": "rx_rdy",
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
            "x": 1800,
            "y": 704
          }
        },
        {
          "id": "8914ed41-cd34-48df-8ed5-bc2eed80848e",
          "type": "basic.input",
          "data": {
            "name": "rx_rd",
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
  },
  "dependencies": {}
}