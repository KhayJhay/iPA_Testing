import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../utils/widgets/detail_expanded_widget.dart';
import '../../../../../../../utils/widgets/detail_tile_widget.dart';

class Company_Details_Component extends StatelessWidget {
  const Company_Details_Component({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.6.sh,
      child: ListView(
        padding: EdgeInsets.only(bottom: 120),
        children: [
          Detail_Expanded_Widget(
            title: '* Company Details',
            element: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Detail_Tile_Widget(
                            title: 'Company Name',
                            Subtitl: 'TesMeMa Multimedia',
                          ),
                          Detail_Tile_Widget(
                            title: 'Presented by',
                            Subtitl: 'Kwame Appiah',
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Detail_Tile_Widget(
                            title: 'Date of Commencement',
                            Subtitl: '12/12/2020',
                          ),
                          Detail_Tile_Widget(
                            title: 'GhanaCard/TIN',
                            Subtitl: 'GHA-0002838844-0',
                          ),
                        ],
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Detail_Tile_Widget(
                              title:
                                  'Principal Business Activities (ISIC codes)',
                              Subtitl:
                                  'Crops and Animal Production | Growing of non-perenial',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Detail_Tile_Widget(
                              title: 'Nature of Business',
                              Subtitl: 'Legal | Shipping & Port ',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Detail_Expanded_Widget(
            title: '* Registered Office Address',
            element: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Detail_Tile_Widget(
                          title: 'Digital Address',
                          Subtitl: 'GA-026-6623',
                        ),
                        Detail_Tile_Widget(
                          title: 'District',
                          Subtitl: 'Tema East',
                        ),
                        Detail_Tile_Widget(
                          title: 'Country',
                          Subtitl: 'Ghana',
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Detail_Tile_Widget(
                          title: 'Street Name',
                          Subtitl: 'Osu Street',
                        ),
                        Detail_Tile_Widget(
                          title: 'City',
                          Subtitl: 'Accra',
                        ),
                        Detail_Tile_Widget(
                          title: 'Region',
                          Subtitl: 'Greater Accra',
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Detail_Tile_Widget(
                          title: 'House/Building/Flat No./LMB',
                          Subtitl: 'Tema Steel PMB',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Detail_Expanded_Widget(
            title: '* Other Places of Business',
            element: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Detail_Tile_Widget(
                          title: 'Digital Address',
                          Subtitl: 'GA-026-6623',
                        ),
                        Detail_Tile_Widget(
                          title: 'District',
                          Subtitl: 'Tema East',
                        ),
                        Detail_Tile_Widget(
                          title: 'Country',
                          Subtitl: 'Ghana',
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Detail_Tile_Widget(
                          title: 'Street Name',
                          Subtitl: 'Osu Street',
                        ),
                        Detail_Tile_Widget(
                          title: 'City',
                          Subtitl: 'Accra',
                        ),
                        Detail_Tile_Widget(
                          title: 'Region',
                          Subtitl: 'Greater Accra',
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Detail_Tile_Widget(
                          title: 'House/Building/Flat No./LMB',
                          Subtitl: 'Tema Steel PMB',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Detail_Expanded_Widget(
              title: '* Business Contact Details',
              element: Column(children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Detail_Tile_Widget(
                          title: 'Phone Number 1',
                          Subtitl: '+233 544 366 446',
                        ),
                        Detail_Tile_Widget(
                          title: 'Phone Number 2',
                          Subtitl: '+233 544 366 446',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Detail_Tile_Widget(
                          title: 'Phone Number 3',
                          Subtitl: '+233 544 366 446',
                        ),
                        Detail_Tile_Widget(
                          title: 'Email Address',
                          Subtitl: 'tesmacon@gmail.com',
                        ),
                      ],
                    ),
                  ],
                ),
              ])),
          Detail_Expanded_Widget(
            title: '* Proprietor/Proprietress Details',
            element: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Detail_Tile_Widget(
                          title: 'Title',
                          Subtitl: 'Mr.',
                        ),
                        Detail_Tile_Widget(
                          title: 'Sex',
                          Subtitl: 'Male',
                        ),
                        Detail_Tile_Widget(
                          title: 'First Name',
                          Subtitl: 'Amani',
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Detail_Tile_Widget(
                          title: 'Middle Name',
                          Subtitl: 'Noin',
                        ),
                        Detail_Tile_Widget(
                          title: 'Last Name',
                          Subtitl: 'Ntum',
                        ),
                        Detail_Tile_Widget(
                          title: 'Former name',
                          Subtitl: 'N/A',
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Detail_Tile_Widget(
                          title: 'Nationality',
                          Subtitl: 'Ghanaian',
                        ),
                        Detail_Tile_Widget(
                          title: 'Occupation',
                          Subtitl: 'Real Estate Developer',
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Detail_Tile_Widget(
                          title: 'GhanaCard',
                          Subtitl: 'GHA-002736663-0',
                        ),
                        Detail_Tile_Widget(
                          title: 'TIN Number',
                          Subtitl: 'N/A',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Detail_Expanded_Widget(
            title: '* Proprietor/Proprietress Contact Details',
            element: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Detail_Tile_Widget(
                          title: 'Phone Number 1',
                          Subtitl: '+233 544 366 446',
                        ),
                        Detail_Tile_Widget(
                          title: 'Phone Number 2',
                          Subtitl: '+233 544 366 446',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Detail_Tile_Widget(
                          title: 'Phone Number 3',
                          Subtitl: '+233 544 366 446',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Detail_Expanded_Widget(
            title: '* Proprietor/Proprietress Address Details',
            element: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Detail_Tile_Widget(
                          title: 'Digital Address',
                          Subtitl: 'GA-026-6623',
                        ),
                        Detail_Tile_Widget(
                          title: 'District',
                          Subtitl: 'Tema East',
                        ),
                        Detail_Tile_Widget(
                          title: 'Country',
                          Subtitl: 'Ghana',
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Detail_Tile_Widget(
                          title: 'Street Name',
                          Subtitl: 'Osu Street',
                        ),
                        Detail_Tile_Widget(
                          title: 'City',
                          Subtitl: 'Accra',
                        ),
                        Detail_Tile_Widget(
                          title: 'Region',
                          Subtitl: 'Greater Accra',
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Detail_Tile_Widget(
                          title: 'House/Building/Flat No./LMB',
                          Subtitl: 'Tema Steel PMB',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Detail_Expanded_Widget(
            title: '* MSME Details',
            element: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Detail_Tile_Widget(
                          title: 'Revenue Envisaged',
                          Subtitl: 'GHS 2,900,000,000',
                        ),
                        Detail_Tile_Widget(
                          title: 'No. of Employees Envisaged',
                          Subtitl: '77000',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Detail_Expanded_Widget(
            title: '* Business  Operating Permit',
            element: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Detail_Tile_Widget(
                          title: 'BOP Reference Number',
                          Subtitl: 'N/A',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
