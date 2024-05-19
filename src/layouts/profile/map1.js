import React, { useEffect, useState } from 'react';
import { MapContainer, TileLayer, GeoJSON } from 'react-leaflet';
import 'leaflet/dist/leaflet.css';

const containerStyle = {
  width: '100%',
  height: '400px',
};

const center = [15.345640, 76.335109];

const districtValues = {
  'Bagalkote': 27101,
  'Ballari': 21055,
  'Bengaluru Rural': 14589,
  'Bangalore': 20538,
  'Belagavi': 18965,
  'Bidar': 38112,
  'Chamarajanagara': 17400,
  'Chikkaballapura': 13288,
  'Chikkamagaluru': 33338,
  'Chitradurga': 46664,
  'Dakshina Kannada': 21942,
  'Davanagere': 41943,
  'Dharwad': 15380,
  'Gadag': 14325,
  'Hassan': 64399,
  'Haveri': 29440,
  'Kalaburagi': 24675,
  'Kodagu': 18327,
  'Kolar': 21636,
  'Koppal': 20702,
  'Mandya': 54474,
  'Mysuru': 15587,
  'Raichur': 27057,
  'Ramanagara': 40902,
  'Shivamogga': 58342,
  'Tumakuru': 66879,
  'Udupi': 25824,
  'Uttara Kannada': 32536,
  'Vijayapura': 22018,
  'Yadgir': 17936,
};

const MapComponent = () => {
  const [geoJsonData, setGeoJsonData] = useState(null);

  useEffect(() => {
    fetch('/map.geojson')
      .then((response) => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then((data) => {
        console.log('GeoJSON data:', data); // Log the fetched data
        if (data && data.type === 'FeatureCollection') {
          setGeoJsonData(data);
        } else {
          console.error('Invalid GeoJSON data:', data);
        }
      })
      .catch((error) => {
        console.error('Error loading GeoJSON file:', error);
      });
  }, []);

  const getColor = (district) => {
    const value = districtValues[district];
    return value > 60000 ? '#800026' :
           value > 50000  ? '#BD0026' :
           value > 40000  ? '#E31A1C' :
           value > 30000  ? '#FC4E2A' :
           value > 20000   ? '#FD8D3C' :
           value > 10000   ? '#FEB24C' :
           value > 5000   ? '#FED976' :
                          '#FFEDA0';
  };

  const onEachFeature = (feature, layer) => {
    if (feature.properties && feature.properties.dtname) {
      const district = feature.properties.dtname;
      const value = districtValues[district];
      layer.bindPopup(`<b>District:</b> ${district}<br/><b>No of victims:</b> ${value}`);
    }
  };

  const style = (feature) => {
    const district = feature.properties.dtname;
    return {
      fillColor: getColor(district),
      weight: 1,
      opacity: 1,
      color: 'black',
      fillOpacity: 0.7,
    };
  };

  const legend = (
    <div style={{ position: 'absolute', bottom: 10, left: 10, zIndex: 1000, backgroundColor: 'white', padding: 10, border: '1px solid #ccc', borderRadius: 5 }}>
      <h4>Legend</h4>
      <div>
      <div style={{ backgroundColor: '#800026', width: 20, height: 20, display: 'inline-block' }}></div> more than 60000<br />
        <div style={{ backgroundColor: '#BD0026', width: 20, height: 20, display: 'inline-block' }}></div> 50000-60000<br />
        <div style={{ backgroundColor: '#E31A1C', width: 20, height: 20, display: 'inline-block' }}></div> 40000-50000<br />
        <div style={{ backgroundColor: '#FC4E2A', width: 20, height: 20, display: 'inline-block' }}></div> 30000-40000<br />
        <div style={{ backgroundColor: '#FD8D3C', width: 20, height: 20, display: 'inline-block' }}></div> 20000-30000<br />
        <div style={{ backgroundColor: '#FEB24C', width: 20, height: 20, display: 'inline-block' }}></div> 15000-20000<br />
        <div style={{ backgroundColor: '#FED976', width: 20, height: 20, display: 'inline-block' }}></div> 10000-15000<br />
        <div style={{ backgroundColor: '#FFEDA0', width: 20, height: 20, display: 'inline-block' }}></div> less then 5000
      </div>
    </div>
  );

  return (
    <div style={containerStyle}>
      <MapContainer center={center} zoom={6} style={containerStyle}>
        <TileLayer
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        />
        {geoJsonData ? (
          <>
            <GeoJSON
              data={geoJsonData}
              style={style}
              onEachFeature={onEachFeature}
            />
            {legend}
          </>
        ) : (
          <p>Loading GeoJSON data...</p>
        )}
      </MapContainer>
    </div>
  );
};

export default MapComponent;
