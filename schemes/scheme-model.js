const db = require('../data/dbConfig.js');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove,
    addStep
};

function find() {
    return db('schemes')
}

function findById(id) {
    return db('schemes')
        .where({ id })
        .first()
}

function findSteps(id) {
    return db('steps')
        .join('schemes','schemes.id', 'steps.scheme_id' )
        .select('schemes.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions')
        .where({scheme_id: id})
        .orderBy('steps.step_number')
}

function add(schemeData) {
    return db('schemes').insert(schemeData);
}
  
  function addStep(stepData, id) {
    return db('steps')
        .where({scheme_id: id})
        .insert(stepData);
}

function update(changes, id) {
    return db('schemes')
        .where({ id })
        .update(changes);
}

function remove(id) {
    return db('schemes')
        .where({ id })
        .del()
}
