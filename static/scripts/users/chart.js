
'use strict';

(function () {
  let cardColor, headingColor, axisColor, shadeColor, borderColor, data, customerData;
  const totalRevenueChartEl = document.querySelector('#totalRevenueChart');

  cardColor = config.colors.white;
  headingColor = config.colors.headingColor;
  axisColor = config.colors.axisColor;
  borderColor = config.colors.borderColor;

  // get id from the url
  const userID = document.getElementById("user_id").value

  if (userID) {
    $.ajax({
      method: "GET",
      url: `/user_chart/${userID}`,
      headers: { "X-CSRFToken": csrftoken },

      success: function (response) {
        if (!response.isError) {
          data = response.vehicles
          customerData = response.customers;

          const count = new Array(12).fill(0)
          data.map(numbers => count[numbers.month - 1] = numbers.count)

          const customerCount = new Array(12).fill(0) // fill it 12 zeros
          // now only update which month have value 
          customerData.map(numbers => customerCount[numbers.month - 1] = numbers.count)

          const totalRevenueChartOptions = {
            series: [
              {
                name: 'Vehicles',
                data: count
              },
              {
                name: 'Customers',
                data: customerCount
              },
            ],
            chart: {
              height: 500,
              stacked: false,
              type: 'bar',
              toolbar: { show: true }
            },
            plotOptions: {
              bar: {
                horizontal: false,
                columnWidth: '33%',
                borderRadius: 5,
                startingShape: 'rounded',
                endingShape: 'rounded'
              }
            },
            colors: [config.colors.primary, config.colors.info],
            dataLabels: {
              enabled: false
            },
            stroke: {
              curve: 'smooth',
              width: 2,
              lineCap: 'round',
              colors: [cardColor]
            },
            legend: {
              show: true,
              horizontalAlign: 'left',
              position: 'top',
              markers: {
                height: 8,
                width: 8,
                radius: 12,
                offsetX: -3
              },
              labels: {
                colors: axisColor
              },
              itemMargin: {
                horizontal: 10
              }
            },
            grid: {
              borderColor: borderColor,
              padding: {
                top: 0,
                bottom: -8,
                left: 20,
                right: 20
              }
            },
            xaxis: {
              categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
              labels: {
                style: {
                  fontSize: '13px',
                  colors: axisColor
                }
              },
              axisTicks: {
                show: false
              },
              axisBorder: {
                show: false
              }
            },
            yaxis: {
              labels: {
                style: {
                  fontSize: '13px',
                  colors: axisColor
                }
              }
            },
            responsive: [
              {
                breakpoint: 1700,
                options: {
                  plotOptions: {
                    bar: {
                      borderRadius: 10,
                      columnWidth: '32%'
                    }
                  }
                }
              },
              {
                breakpoint: 1580,
                options: {
                  plotOptions: {
                    bar: {
                      borderRadius: 10,
                      columnWidth: '35%'
                    }
                  }
                }
              },
              {
                breakpoint: 1440,
                options: {
                  plotOptions: {
                    bar: {
                      borderRadius: 10,
                      columnWidth: '42%'
                    }
                  }
                }
              },
              {
                breakpoint: 1300,
                options: {
                  plotOptions: {
                    bar: {
                      borderRadius: 10,
                      columnWidth: '48%'
                    }
                  }
                }
              },
              {
                breakpoint: 1200,
                options: {
                  plotOptions: {
                    bar: {
                      borderRadius: 10,
                      columnWidth: '40%'
                    }
                  }
                }
              },
              {
                breakpoint: 1040,
                options: {
                  plotOptions: {
                    bar: {
                      borderRadius: 11,
                      columnWidth: '48%'
                    }
                  }
                }
              },
              {
                breakpoint: 991,
                options: {
                  plotOptions: {
                    bar: {
                      borderRadius: 10,
                      columnWidth: '30%'
                    }
                  }
                }
              },
              {
                breakpoint: 840,
                options: {
                  plotOptions: {
                    bar: {
                      borderRadius: 10,
                      columnWidth: '35%'
                    }
                  }
                }
              },
              {
                breakpoint: 768,
                options: {
                  plotOptions: {
                    bar: {
                      borderRadius: 10,
                      columnWidth: '28%'
                    }
                  }
                }
              },
              {
                breakpoint: 640,
                options: {
                  plotOptions: {
                    bar: {
                      borderRadius: 10,
                      columnWidth: '32%'
                    }
                  }
                }
              },
              {
                breakpoint: 576,
                options: {
                  plotOptions: {
                    bar: {
                      borderRadius: 10,
                      columnWidth: '37%'
                    }
                  }
                }
              },
              {
                breakpoint: 480,
                options: {
                  plotOptions: {
                    bar: {
                      borderRadius: 10,
                      columnWidth: '45%'
                    }
                  }
                }
              },
              {
                breakpoint: 420,
                options: {
                  plotOptions: {
                    bar: {
                      borderRadius: 10,
                      columnWidth: '52%'
                    }
                  }
                }
              },
              {
                breakpoint: 380,
                options: {
                  plotOptions: {
                    bar: {
                      borderRadius: 10,
                      columnWidth: '60%'
                    }
                  }
                }
              }
            ],
            states: {
              hover: {
                filter: {
                  type: 'none'
                }
              },
              active: {
                filter: {
                  type: 'none'
                }
              }
            }
          };
          if (typeof totalRevenueChartEl !== undefined && totalRevenueChartEl !== null) {
            const totalRevenueChart = new ApexCharts(totalRevenueChartEl, totalRevenueChartOptions);
            totalRevenueChart.render();
          }

        } else {
          Swal.fire("Error", response.Message, "error");
        }
      },
      error: function (error) {
        // handle error 
        Swal.fire("Error", error.responseText, "error");

      }
    })

  }

})()
