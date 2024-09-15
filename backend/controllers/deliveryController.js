const DeliveryModule = require('../models/DeliveryModule');
const Variant = require('../models/Variant');

exports.estimateDelivery = async (req, res) => {
  const { variant_id, city } = req.body;
  try {
    const variant = await Variant.getVariantById(variant_id);
    if (!variant) {
      return res.status(404).json({ message: 'Variant not found' });
    }

    let estimatedDays = 0;
    if (variant.inventory_stock > 0) {
      if (city.toLowerCase() === 'colombo') {
        estimatedDays = 5;
      } else {
        estimatedDays = 7;
      }
    } else {
      if (city.toLowerCase() === 'colombo') {
        estimatedDays = 8; // 5 + 3
      } else {
        estimatedDays = 10; // 7 + 3
      }
    }

    const estimatedArrivalDate = new Date();
    estimatedArrivalDate.setDate(estimatedArrivalDate.getDate() + estimatedDays);

    const deliveryModuleId = await DeliveryModule.createDeliveryModule(estimatedArrivalDate.toISOString().split('T')[0]);

    res.json({ estimatedArrivalDate });
  } catch (error) {
    console.error('Error in estimateDelivery:', error);
    res.status(500).json({ message: 'Error estimating delivery', error: error.toString() });
  }
};