checkPrefixCount= function () {
    return db.phones.aggregate([
        {
            $group: {
                _id: "$components.prefix",
                count: { $sum: 1 }
            }
        }
    ]);
        }